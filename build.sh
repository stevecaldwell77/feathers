#!/bin/sh

HADOOP_JAR="$HOME/hadoop-core.jar"
STREAMING_JAR="$HOME/contrib/streaming/hadoop-streaming.jar"

rm -rf classes 2> /dev/null
rm feathers.jar 2> /dev/null
if test "$1" = clean; then exit; fi

mkdir classes
javac -classpath "$HADOOP_JAR:$STREAMING_JAR" -d classes src/*/*.java 
jar -cvf feathers.jar -C classes/ .
