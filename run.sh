#!/bin/bash

set -e

cat /var/log/auth* | grep "authentication failure \| Failed password \| invalid user \| incorrect \| Auth fail \| Unable to negotiate" > failed_attempts.txt

python3 SSHHeatmap.py failed_attempts.txt "$API_KEY" "$MIN"

cat heatmap.html
