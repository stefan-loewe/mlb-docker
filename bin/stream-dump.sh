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

if [ $OFFSET -eq 0 ]; then
  echo "full command is: 'mlbplay -r $RESOLUTION -d $DATE -s "${TRANSFER_DIR}${FILENAME}" $TEAM'"
  mlbplay -r $RESOLUTION -d $DATE -s "${TRANSFER_DIR}${FILENAME}" $TEAM
else
  echo "full command is: 'mlbplay -r $RESOLUTION -d $DATE -b $OFFSET -s "${TRANSFER_DIR}${FILENAME}" $TEAM'"
  mlbplay -r $RESOLUTION -d $DATE -b $OFFSET -s "${TRANSFER_DIR}${FILENAME}" $TEAM
fi

