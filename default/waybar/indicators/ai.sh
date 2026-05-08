#!/bin/bash

state_file=${XDG_STATE_HOME:-$HOME/.local/state}/omarchy/indicators/ai

if [[ -e $state_file ]]; then
  state=$(<"$state_file")

  if [[ $state == "listening" ]]; then
    echo '{"text":"󱚟","class":"active listening","tooltip":"AI is listening"}'
  else
    if (( $(date +%s) % 2 == 0 )); then
      echo '{"text":"󱜙","class":"active thinking","tooltip":"AI is thinking"}'
    else
      echo '{"text":"󱚥","class":"active thinking","tooltip":"AI is thinking"}'
    fi
  fi
else
  echo '{"text":"","class":"","tooltip":""}'
fi
