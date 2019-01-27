#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -test -d /spark
if [ $? != 0 ]
then
  $HADOOP_HOME/bin/hdfs dfs -put $SPARK_HOME-2.4.0-bin-hadoop2.7/lib /spark
else
  echo "Spark already on HDFS"
fi

spark-shell --master yarn
