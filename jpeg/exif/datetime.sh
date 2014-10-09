#!/bin/bash

FILE=$1
SHIFT=$2

date -d "`exif -m -t 0x0132 \"$FILE\" | sed 's/\([0-9]\{4\}\):\([0-9]\{2\}\):\([0-9]\{2\}\)/\1-\2-\3/'` $SHIFT" +%Y%m%d-%H%M%S

