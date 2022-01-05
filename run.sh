#!/usr/bin/env bash

java -jar target/demo-0.0.1-SNAPSHOT.jar &
sleep 20
echo $! > .pidfile