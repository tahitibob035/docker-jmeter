#!/bin/sh

if [ $# -eq 0 ] ; then
    echo 'Usage : -t "testplan1.jmx testplan2.jmx"'
    exit 0
fi

while getopts t: option
do
  case "${option}"
    in
    t) TESTPLANS=${OPTARG};;
  esac
done

echo "TESTPLANS : $TESTPLANS"
for fn in $TESTPLANS; do
    echo "START test plan... '$fn' : "
    PATHFILENAME="${fn%.*}"
    FILENAME=$(basename "$fn" .jmx)
    if [ -d "$PATHFILENAME" ]; then
      echo "Delete directory $PATHFILENAME..."
      rm -rf $PATHFILENAME
    fi
    /app/apache-jmeter-3.2/bin/jmeter -n -t /app/$fn -l /app/results/$PATHFILENAME/$FILENAME.csv -j /app/results/$PATHFILENAME/logs/$FILENAME.log
    echo "END test plan $fn."
done
