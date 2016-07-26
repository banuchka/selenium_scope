#!/usr/bin/with-contenv bash
GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
DSP=$(echo $DISPLAY | sed -r -e 's/([^:]+)?:([0-9]+)(\.[0-9]+)?/\2/')
JAVA_OPTS="-Xmx1024m -XX:-UsePerfData -XX:+UseParallelOldGC"

cd /opt/selenium

exec s6-setuidgid seluser xvfb-run -n ${DSP} --server-args="-screen 0 ${GEOMETRY} -ac +extension RANDR" java ${JAVA_OPTS} -jar ./SeleniumGridExtras-1.12.3-SNAPSHOT-jar-with-dependencies.jar
