#!/bin/bash
gearman="gearmand -L 0.0.0.0"

case "${QUEUE_TYPE}" in
	'mysql')
		gearman="${gearman} --queue-type=${QUEUE_TYPE} --mysql-host=${MYSQL_HOST:-localhost} --mysql-port=${MYSQL_PORT:-3306} --mysql-user=${MYSQL_USER:-root} --mysql-password=${MYSQL_PASSWORD:-password} --mysql-db=${MYSQL_DB:-gearman} --mysql-table=${MYSQL_TABLE:-gearman_queue}"
		/wait-for-it.sh -s ${MYSQL_HOST:-localhost}:${MYSQL_PORT:-3306}
		;;
esac

exec ${gearman}
