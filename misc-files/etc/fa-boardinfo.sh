#!/bin/bash
MODEL=$(cat /proc/device-tree/board/model)
BOARD=$(echo "${MODEL// /-}" | awk '{print tolower($0)}')
