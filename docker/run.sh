#!/bin/bash

Xvfb :1 -screen 0 800x600x16 &
/usr/local/share/emptyepsilon/EmptyEpsilon httpserver=8888 headless=scenario_01_waves.lua headless_name=Federation headless_password=supersecretpassword headless_internet=1