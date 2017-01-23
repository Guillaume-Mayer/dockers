#!/bin/bash
#script de alertas para slack de Centauri.co

username="$(hostname)"
text="$(date)\n\n$1\n============================================"

curl -X POST --data-urlencode 'payload={"username": "'"$username"'", "text": "'"$text"'", "icon_emoji": ":coipux-batman:"}' https://hooks.slack.com/services/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
