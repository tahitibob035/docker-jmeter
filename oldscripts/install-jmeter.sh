#!/bin/bash

jmeterdir='jmeter'

mkdir $jmeterdir
cd $jmeterdir

wget http://mirrors.ircam.fr/pub/apache//jmeter/binaries/apache-jmeter-3.2.tgz
tar -xvzf apache-jmeter-3.2.tgz -C ./

wget http://central.maven.org/maven2/kg/apc/jmeter-plugins-manager/0.13/jmeter-plugins-manager-0.13.jar
cp ./jmeter-plugins-manager-0.13.jar apache-jmeter-3.2/lib/ext/

wget http://central.maven.org/maven2/kg/apc/jmeter-plugins-casutg/2.1/jmeter-plugins-casutg-2.1.jar
cp ./jmeter-plugins-casutg-2.1.jar apache-jmeter-3.2/lib/ext/
