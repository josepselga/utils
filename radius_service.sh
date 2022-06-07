#!/bin/bash


while [ -n "$1" ]; do
    case "$1" in
    -a | --action) action=$2; shift 2;;
    --) shift; break ;;
    *) break ;;
    esac
done

if [ -z "$action" ]; then
    echo "Please specify -a [start/stop/restart]"
    exit 1
fi

for server in "$@"
do
    echo -e "\n\n$action radiusd -> $server"
        ssh root@$server "service radiusd $action"
done
