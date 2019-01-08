#!/bin/bash

set -eu;

if test ! -e "$HOME/.ssh/config"; then
    mkdir -p "$HOME/.ssh";
    cat > "$HOME/.ssh/config" << 'EOL'
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 1000
EOL
fi;