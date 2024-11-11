#!/bin/bash

curl -H @cookie_headers.txt "$1" | grep '<source type="audio/ogg" src="' | cut -d '"' -f4
