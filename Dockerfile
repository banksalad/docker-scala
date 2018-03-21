FROM openjdk:8-jre-alpine

LABEL maintainer="engineering@rainist.com"

ENV SCALA_VERSION 2.12.5
ENV SCALA_HOME /usr/local/scala

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    apk add --update alpine-sdk && \
    wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    rm "scala-${SCALA_VERSION}/bin/"*.bat && \
    mkdir "${SCALA_HOME}" && \
    mv "scala-${SCALA_VERSION}/bin" "scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "scala-${SCALA_VERSION}" && \
    rm "scala-${SCALA_VERSION}.tgz" && \
    scala -version
