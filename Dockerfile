FROM openjdk:8u131-jdk-alpine

ARG product
ARG version

LABEL \
  version=${version} \
  product=${product} \
  maintainer="Thomas Lion"

RUN addgroup -g 1000 jmeter \
    && adduser -u 1000 -G jmeter -s /bin/sh -D jmeter

WORKDIR /app

# Download jmeter 3.2 && Download plugins manager and casutg plugin
RUN wget http://mirrors.ircam.fr/pub/apache//jmeter/binaries/apache-jmeter-3.2.tgz \
 && tar -xvzf apache-jmeter-3.2.tgz -C ./ \
 && rm -f apache-jmeter-3.2.tgz \
 && wget http://central.maven.org/maven2/kg/apc/jmeter-plugins-manager/0.13/jmeter-plugins-manager-0.13.jar \
 && wget http://central.maven.org/maven2/kg/apc/jmeter-plugins-casutg/2.1/jmeter-plugins-casutg-2.1.jar \
 && cp ./jmeter-plugins-manager-0.13.jar apache-jmeter-3.2/lib/ext/ \
 && cp ./jmeter-plugins-casutg-2.1.jar apache-jmeter-3.2/lib/ext/

# copy test plans
COPY ./testplans /app/testplans/

# Script for run the tests
COPY runtests.sh /app/
RUN ln -fs /app/runtests.sh /usr/local/bin/runtests \
    && chown -R jmeter:jmeter /app/
