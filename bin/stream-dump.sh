#!/usr/bin/env bash

TRANSFER_DIR='/data/'

# Get named parameters, inspired by https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
  -r|--resolution)
    RESOLUTION="$2"
    shift # past argument
    shift # past value
    ;;
  -c|--call-letters)
    CALL_LETTERS="$2"
    shift # past argument
    shift # past value
    ;;
  -d|--date)
    DATE="$2"
    shift # past argument
    shift # past value
    ;;
  -o|--offset)
    OFFSET="$2"
    shift # past argument
    shift # past value
    ;;
  -f|--filename)
    FILENAME="$2"
    shift # past argument
    shift # past value
    ;;
  -t|--team)
    TEAM="$2"
    shift # past argument
    shift # past value
    ;;
  *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# convert all arguments to lower case
RESOLUTION="$(tr [:upper:] [:lower:] <<< "${RESOLUTION}")"
DATE="$(tr [:upper:] [:lower:] <<< "${DATE}")"
# OFFSET="$(tr [:upper:] [:lower:] <<< "${OFFSET}")"
FILENAME="$(tr [:upper:] [:lower:] <<< "${FILENAME}")"
TEAM="$(tr [:upper:] [:lower:] <<< "${TEAM}")"
CALL_LETTERS="$(tr [:upper:] [:lower:] <<< "${CALL_LETTERS}")"

if [ -z "$OFFSET" ]; then
  echo "full command is: 'mlbplay -r $RESOLUTION -c $CALL_LETTERS -s "${TRANSFER_DIR}${FILENAME}" mlb/$DATE.$TEAM'"
  mlbplay -r $RESOLUTION -c $CALL_LETTERS -s "${TRANSFER_DIR}${FILENAME}" mlb/$DATE.$TEAM
else
  echo "full command is: 'mlbplay -r $RESOLUTION -b $OFFSET -c $CALL_LETTERS -s "${TRANSFER_DIR}${FILENAME}" mlb/$DATE.$TEAM'"
  mlbplay -r $RESOLUTION -b $OFFSET -c $CALL_LETTERS -s "${TRANSFER_DIR}${FILENAME}" mlb/$DATE.$TEAM
fi

