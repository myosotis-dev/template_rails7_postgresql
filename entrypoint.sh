#!/bin/sh
echo "db creating..."
rails db:create && rails db:migrate
# echo "save seed record..."
# rails db:seed

echo "start rails server with exec."
set -e
rm -f ./tmp/pids/server.pid
exec bin/rails s -b 0.0.0.0
