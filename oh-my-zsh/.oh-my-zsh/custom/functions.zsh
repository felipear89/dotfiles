#!/bin/bash

# find shorthand
function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}


