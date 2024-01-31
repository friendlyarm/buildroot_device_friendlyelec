#!/bin/bash
MODEL=$(tr -d '\0' < /proc/device-tree/board/model)
BOARD=$(echo "${MODEL// /-}" | awk '{print tolower($0)}')
