FROM openjdk:8-jre-stretch

LABEL maintainer="engineering@rainist.com"

ENV SCALA_VERSION 2.12.7
ENV SCALA_HOME /usr/local/scala

RUN wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    rm "scala-${SCALA_VERSION}/bin/"*.bat && \
    mkdir "${SCALA_HOME}" && \
    mv "scala-${SCALA_VERSION}/bin" "scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "scala-${SCALA_VERSION}" && \
    rm "scala-${SCALA_VERSION}.tgz" && \
    scala -version
