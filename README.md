# mlb-docker

## What is this?

This project provides a docker image around the tool `mlbplay` of the mlbstreamer project. The advantage of the docker-based approach is to circumvent integration issues, e.g., when using `pip` on Ubuntu.

## How to build the container?
1. Clone the repository
2. Add your mlb.tv credentials to `./bin/config.yaml`
3. run `build.sh` script, which will build an image called `mlb:latest`

## How to watch a game?
1. run `run.sh` which will start the container, using these optional parameters:
    1.1. -r, --resolution: the preffered resoltion, i.e., one of 720p_alt, 720p, 540p, 504p, 360p, 288p, 224p, defaults to 360p
    1.2. -d, --date: the date of the game to get, must be in the format 'yyyy-mm-dd'
    1.3. -f, --filename: the name of the file to which store the stream, defaults to 'stream.mp4', output directory will be `games`
    1.4. -t, --team: the team for which to get the game, must be one of 'cle', 'tor', 'ana', ...
2. once the download started, open a new session and run, e.g., `vlc games/stream.mp4`

## Examples

watch the Indians win in standard-definition
`./run.sh -r 360p -d 2018-07-04 -t tor`

watch the Indians win today
`./run.sh -t cle`

watch the Blue Jays loose in high-definition, with 60fps
`./run.sh -r 720p_alt -d 2018-07-04 -t tor`

watch the Blue Jays loose again in high-definition, 30fps
`./run.sh -r 720p -d 2018-07-02 -t tor`
