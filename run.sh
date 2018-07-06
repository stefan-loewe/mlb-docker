#!/usr/bin/env bash

RESOLUTION="360p" # possible values are: 720p_alt, 720p, 540p, 504p, 360p, 288p, 224p
DATE=$(date +%Y-%m-%d) # format: yyyy-mm-dd
FILENAME="stream.mp4" # file name, defaults to "stream.mp4"
TEAM="cle" # possible values are cle, tor, ana, ...


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
FILENAME="$(tr [:upper:] [:lower:] <<< "${FILENAME}")"
TEAM="$(tr [:upper:] [:lower:] <<< "${TEAM}")"

PWD=$(pwd)

echo "running docker container via: docker run -ti -v $PWD/games/:/data mlb:latest /stream-dump.sh -r $RESOLUTION -d $DATE -f $FILENAME -t $TEAM"
docker run -ti -v $PWD/games/:/data mlb:latest /stream-dump.sh -r $RESOLUTION -d $DATE -f $FILENAME -t $TEAM