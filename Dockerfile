FROM alpine
SHELL ["/bin/sh", "-c"]

# tool for build
RUN apk update \
    && apk add \
                git \
                g++

WORKDIR usable
COPY . .

RUN git clone https://github.com/liam-ilan/crumb.git __temp

# use specific sha
# build crumb interpreter from source
# move to workdir and clean up
RUN cd __temp \
    && git reset --hard 9e5bdf26a608ab1c6f3bc5afc7b8daf17afde153 \
    && gcc src/*.c -Wall -lm -o crumb \
    && cd .. \
    && mv ./__temp/crumb crumb \
    && rm -rf __temp
