#!/bin/sh
set -e

rm -f /myapp/tmp/pids/server.pid && bin/rails s
bin/rails db:migrate
bin/rails db:seed_fu

exec "$@"
