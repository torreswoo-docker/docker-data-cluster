# Docker Spark Hadoop

- http://localhost:50070 # namenode
- http://localhost:50090 # namenode secondary
- http://localhost:8088  # YARN resource manager
- http://localhost:8042  # YARN node manager


## Build the base image

```
docker build -t molab/hadoop hadoop
docker build -t molab/spark-yarn spark
docker build -t molab/spark-notebook notebook
docker build -t molab/zeppelin zeppelin
```

## Run hadoop

```
docker-compose -f hadoop/docker-compose.yml up -d
```

## Run a spark shell

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-yarn
```

## Run a notebook

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-notebook
```

In the notebook run

```
from pyspark import SparkContext
sc = SparkContext(master="yarn-client")
```

## Run zeppelin

```
docker run --rm -ti -p 8080:8080 -p 8081:8081 --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/zeppelin
```
