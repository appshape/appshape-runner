#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

server_started() {
  lsof -i :4567 >/dev/null
}

timestamp() {
  date +%s
}

wait_for_server() {
  timeout=$(( `timestamp` + $1 ))
  while true; do
    if server_started "$2"; then
      break
    elif [ `timestamp` -gt "$timeout" ]; then
      echo "timed out after $1 seconds" >&2
      return 1
    fi
  done
}

ruby "$DIR/../spec/support/server.rb" &
server_pid=$!

wait_for_server 30 4567

rake test && kill "$server_pid" || kill "$server_pid"