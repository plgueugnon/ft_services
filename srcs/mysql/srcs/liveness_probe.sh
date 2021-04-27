#!/bin/sh

if ! pgrep mariadb > dev/null;
then
    exit 1
fi