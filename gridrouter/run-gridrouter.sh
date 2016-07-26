#!/usr/bin/with-contenv bash

GC_OPTS="-XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled"
MEMORY_OPTS="-Xms512m -Xmx2048m"

JAVA_ARGS="$GC_OPTS $MEMORY_OPTS -Djava.net.preferIPv6Addresses=false"

java $JAVA_ARGS -jar /opt/gridrouter/jetty-runner.jar --classes /etc/grid-router --port 4444 --config /etc/grid-router/jetty.xml /opt/gridrouter/gridrouter-proxy-1.31-SNAPSHOT.war >> /var/log/grid-router/grid-router.log 2>&1
