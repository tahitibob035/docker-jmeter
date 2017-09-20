#!/bin/bash

rm -rf results
jmeter/apache-jmeter-3.2/bin/jmeter -n -t ./JmeterTest.jmx -l ./results/stressTestResults.csv -j ./logs/jmeter.log -e -o ./results
