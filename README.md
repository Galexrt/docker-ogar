# docker-ogar

[![](https://images.microbadger.com/badges/image/galexrt/ogar.svg)](https://microbadger.com/images/galexrt/ogar "Get your own image badge on microbadger.com")

[![Docker Repository on Quay.io](https://quay.io/repository/galexrt/ogar/status "Docker Repository on Quay.io")](https://quay.io/repository/ogar/zulip)

## Usage
## Configuration
Just add environemnt variables beginning with `SETTING_` to your docker run command.
Example variables are:
* `SETTING_serverBots` equals the `serverBots` setting.
* `SETTING_serverGamemode` equals the `serverGamemode` setting.
* `SETTING_foodSpawnAmount` equals the `foodSpawnAmount` setting.
* And so on (all settings can be seen here ([gameserver.ini)](https://github.com/OgarProject/Ogar/blob/master/src/gameserver.ini)).

## Running the image
```
docker run \
    -d \
    --name=ogar \
    -e 'SETTING_serverBots=10' \
    -e 'SETTING_serverGamemode=' \
    quay.io/galexrt/ogar:latest
```
