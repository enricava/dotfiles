local map = require("ecavenr.keys").map
local dap = require("dap")

-- Keymaps
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint in line")
map("n", "<leader>dr", "<cmd>DapContinue<cr>", "Start/continue debugging")
map("n", "<leader>dc", "<cmd>DapContinue<cr>", "Start/continue debugging")
map("n", "<leader>di", "<cmd>DapStepInto<cr>", "Step into")
map("n", "<leader>do", "<cmd>DapStepOver<cr>", "Step over")

-- IO helpers
local function cmd_read(cmd)
  local handle = io.popen(cmd)
  local output = handle:read("*a")
  handle:close()

  output = output:gsub("%s+", "")
  return output
end

local function true_false(prompt)
  return function()
    local choices = {
      prompt,
      '1. yes',
      '2. no',
    }

    return vim.fn.inputlist(choices) == 1
  end
end

-- Telescope helpers
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local binary_finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {})
local image_finder = finders.new_oneshot_job({ "docker", "images", "--format", "{{.Repository}}:{{.Tag}}" }, {})

local function telescoper(prompt, finder)
  return function()
    return coroutine.create(function(coro)
      local opts = {}
      pickers
          .new(opts, {
            prompt_title = prompt,
            finder = finder,
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(buffer_number)
              actions.select_default:replace(function()
                actions.close(buffer_number)
                coroutine.resume(coro, action_state.get_selected_entry()[1])
              end)
              return true
            end,
          })
          :find()
    end)
  end
end

-- Debug adapters
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '--interpreter=dap', '--eval-command', 'set print pretty on' }
}

dap.adapters.dart = {
  type = "executable",
  command = "flutter",
  args = { "debug_adapter", "--test" },
}

-- Debug configurations
local docker_gdb = {
  name = '󰡨 Debug through docker',
  type = 'cppdbg',
  request = 'launch',
  MIMode = 'gdb',
  cwd = '${workspaceFolder}',
  stopAtEntry = true_false(' Stop at entry?'),

  program = telescoper(' Select binary', binary_finder),

  args = function()
    return vim.split(vim.fn.input(' Args?'), ' ')
  end,

  sourceFileMap = {
    ['.'] = '${workspaceFolder}',
  },

  environment = {
    {
      name = 'WS_ROOT',
      value = '${workspaceFolder}'
    },
  },

  pipeTransport = {
    debuggerPath = '/usr/bin/gdb',
    pipeProgram = 'docker',
    pipeCwd = '${workspaceFolder}',
    pipeArgs = {
      'run', '-i', '--rm', '--init',
      '--network', 'none',
      '--user', cmd_read('id -u') .. ':' .. cmd_read('id -g'),
      '--cap-add=SYS_PTRACE',
      '--security-opt', 'seccomp=unconfined',
      '--volume', '${workspaceFolder}:${workspaceFolder}:rw',
      '--workdir', '${workspaceFolder}',
      telescoper('󰡨 Select docker image', image_finder),
      'bash', '-ec',
    },
  },
}

dap.configurations.cpp = { docker_gdb, }

dap.configurations.c = { docker_gdb, }

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Debug open test file",
    cwd = "${workspaceFolder}",
    program = "${relativeFile}",
  },
}
