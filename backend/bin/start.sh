#!/bin/bash
set -eo pipefail


BIN_DIR=$(dirname $(readlink -f "$0"))
PROJECT_HOME=$(cd ${BIN_DIR}/..;pwd)

JVM_ARGS_ENV_FILE=${PROJECT_HOME}/bin/jvm_args_env.sh
JVM_ARGS="-server"

if [ -f $JVM_ARGS_ENV_FILE ]; then
  while read line
  do
      if [[ "$line" == -* ]]; then
        JVM_ARGS="${JVM_ARGS} $line"
      fi
  done < $JVM_ARGS_ENV_FILE
fi

JAVA_OPTS=${JAVA_OPTS:-"${JVM_ARGS}"}

if [[ "$DOCKER" == "true" ]]; then
  JAVA_OPTS="${JAVA_OPTS} -XX:-UseContainerSupport"
fi

echo "JAVA_HOME=${JAVA_HOME}"
echo "JAVA_OPTS=${JAVA_OPTS}"

$JAVA_HOME/bin/java $JAVA_OPTS \
  -cp "$PROJECT_HOME/resources":"$PROJECT_HOME/lib/*":"$PROJECT_HOME/backend-1.0.jar" \
  com.portal.site.backend.App
