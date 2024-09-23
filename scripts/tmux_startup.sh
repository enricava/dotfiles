#!/bin/bash -e

# =============================================================================
# Default values
# =============================================================================

SESSION_NAME="default"
POSITIONAL_ARGS=()

# =============================================================================
# Read arguments
# =============================================================================

while [[ $# -gt 0 ]]; do
  case $1 in
    -n | --name)
      SESSION_NAME="$2"
      shift # past argument
      shift # past value
      ;;
    -* | --*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

ARG_N=${#POSITIONAL_ARGS[@]}

ARG_TRIPLES_OK=$(($ARG_N%3))

if [[ $ARG_TRIPLES_OK -ne 0 ]]; then
  echo "Usage:"

  echo "-n | --name"
  echo " Session name"

  echo

  echo "[window_name startup_path startup_command ..]"
  echo " Pairs of arguments that will be used to populate new tmux windows."
  echo " Lists of commands have to be separated with a ; without space after."
fi

# =============================================================================
# Create or re-open session
# =============================================================================

if [[ $(tmux list-sessions | grep -c $SESSION_NAME) -eq 0 ]]; then
  echo "Creating session"

  tmux new-session -d -s $SESSION_NAME

  # Name first window
  tmux rename-window -t $SESSION_NAME:1 'scratch'
  tmux move-window -s $SESSION_NAME:scratch -t $SESSION_NAME:99

  # Create the other windows
  for ((i=0; i<$ARG_N; i+=3)); do
    window_name=${POSITIONAL_ARGS[$i]}
    path=${POSITIONAL_ARGS[$(($i+1))]}
    command=${POSITIONAL_ARGS[$(($i+2))]}

    # send-keys will parse our command and does not like spaces
    sanitised_command=${command// / Space }

    tmux new-window -t $SESSION_NAME -n $window_name -c $path
    tmux send-keys -t $SESSION_NAME:$window_name $sanitised_command C-m clear C-m
  done
fi

# Finally, attach to the session
tmux attach-session -t $SESSION_NAME:1
