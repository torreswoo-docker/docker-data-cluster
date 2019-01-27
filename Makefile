TAG="cluster"

build-hadoop:
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build hadoop image"
	@ docker build -t molab/hadoop ./hadoop/

build-spark:
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build spark image"
	@ docker build -t molab/spark-yarn ./spark/

build-jupyter:
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build notebook image"
	@ docker build -t molab/spark-notebook ./notebook/

build-zeppelin:
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build zeppelin image"
	@ docker build -t molab/zeppelin ./zeppelin/

build.all: build-hadoop build-spark build-jupyter build-zeppelin
	@ echo "[$(TAG)] ($(shell TZ=UTC date -u '+%H:%M:%S')) - Running build all image"