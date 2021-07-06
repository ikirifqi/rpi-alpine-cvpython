FROM balenalib/rpi-alpine-python:latest

RUN apk --update --no-cache --virtual builder add \
        bash \
        build-base \
        ca-certificates \
        clang-dev \
        clang \
        cmake \
        coreutils \
        curl \
        freetype-dev \
        ffmpeg-dev \
        ffmpeg-libs \
        gcc \
        g++ \
        git \
        gettext \
        lcms2-dev \
        libavc1394-dev \
        libc-dev \
        libffi-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libressl-dev \
        libwebp-dev \
        linux-headers \
        make \
        musl \
        openjpeg-dev \
        openssl \
        tiff-dev \
        unzip \
        zlib-dev && \
    apk add py3-numpy && \
    pip install -U pip && \
    pip install opencv-python-headless && \
    apk del builder

RUN python -c 'import numpy; import cv2; print("Install Success")'

CMD [ "python" ]
