#!/bin/bash

/.build.sh $1 d
gdb --quiet target/$1
