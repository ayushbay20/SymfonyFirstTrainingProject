#!/bin/bash

if [ "$2" == "-db" ]
then
echo "rebuilding database ..."
bin/console doctrine:schema:drop -n -q --force --full-database
rm Migrations/*.php
bin/console make:migration
bin/console doctrine:migrations:migrate -n -q
bin/console doctrine:fixtures:load -n -q
fi

if [-n "$l"]
then
./bin/phpunit $l
else
./bin/phpunit
fi
