#!/bin/sh -l
cd /github/workspace
echo "Scanning $1 with profile $2"
/opt/pycharm-community/bin/inspect.sh "$1" "$2" out/ -format json -v0 2> errors.log

set -e
HASWARNINGS=0
for i in $(find out -name "*.json"); do
    RUNHASWARNINGS=0
    cat $i | python3 /code/parse.py || RUNHASWARNINGS=$?
    if [ $RUNHASWARNINGS -ne 0 ]; then
        HASWARNINGS=1
    fi
done

if [ $HASWARNINGS -ne 0 ]; then
  if [ "$3" != "no" ]; then
    echo "Found issues in code"
    exit 1
  fi
else
  echo "Found no issues in the code"
fi
