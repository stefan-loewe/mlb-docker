# mlb-docker

## What is this?

This project provides a docker image around the tool `mlbplay` of the mlbstreamer project. The advantage of the docker-based approach is to circumvent integration issues, e.g., when using `pip` on Ubuntu.
## How to build the container?
1. Clone the repository
2. Copy `./bin/config.sample.yaml` to `./bin/config.yaml`
3. Adapt `./bin/config.yaml` to your liking, but at least add your mlb.tv credentials there
4. run `build.sh` script, which will build an image called `mlb:latest`

## How to watch a game?
1. run `run.sh` which will start the container, using these optional parameters:
    1. -r, --resolution: the preffered resoltion, i.e., one of 720p_alt, 720p, 540p, 504p, 360p, 288p, 224p, defaults to 360p
    2. -d, --date: the date of the game to get, must be in the format 'yyyy-mm-dd'
    3. -f, --filename: the name of the file to which store the stream, defaults to 'date + team code', output directory will be `games`
    4. -o, --offset: the offset from which to start the stream, either an integer (e.g., 52 would mean 52 minutes from the start) or a string like B6, meaning bottom of the sixth inning [this might be no longer supported by mlbstreamer!]
    5. -t, --team: the team for which to get the game, must be one of 'cle', 'tor', 'ana', ...
2. once the download started, open a new session and run, e.g., `vlc games/2019-04-21.tor.mp4`

## Examples

watch the Toronto Blue Jays game from 2019-04-21 in standard-definition
`./run.sh -r 360p -d 2019-04-21 -t tor`

watch Cleveland's game of today (if already being streamed)
`./run.sh -t cle`

watch the Blue Jays game from 2019-04-21 in high-definition, with 60fps
`./run.sh -r 720p_alt -d 2019-04-21 -t tor`

watch the Blue Jays game in high-definition, 30fps, and start with the bottom of the 8th inning [offsets might no longer be supported by mlbstreamer], dumping the file to `games/dump.mp4`
`./run.sh -r 720p -d 2019-04-21 -t tor -o B8` -f dump.mp4
