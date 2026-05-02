#!/bin/sh
cat /etc/matterbridge.toml.tpl | gomplate > /etc/matterbridge.toml
matterbridge -conf /etc/matterbridge.toml
