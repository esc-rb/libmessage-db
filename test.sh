#!/usr/bin/env bash

set -eu -o pipefail

echo
echo "Running tests"
echo "= = ="
echo

file=${1:-test/automated.zig}

(
  set -x;
  zig test --cache-dir ./zig-cache --pkg-begin message-db src/message_db.zig $file
)

echo
