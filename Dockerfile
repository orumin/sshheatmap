FROM python:3.8-alpine3.11
MAINTAINER orumin

ENV API_KEY dummy

RUN apk add --no-cache --virtual .build-deps \
    curl \
    build-base \
    gfortran \
    openblas-dev \
    && apk --no-cache add bash musl openblas \
    && pip3 install --upgrade pip \
    && pip3 install folium requests ipinfo \
    && curl -LO https://raw.githubusercontent.com/meesaltena/SSHHeatmap/master/SSHHeatmap.py \
    && chmod +x SSHHeatmap.py \
    && apk del --purge .build-deps

COPY run.sh ./
RUN chmod +x run.sh

CMD [ "./run.sh" ]
