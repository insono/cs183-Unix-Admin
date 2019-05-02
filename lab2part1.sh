#!/bin/bash

find /usr/src/kernels -name "*.h" | xargs grep -i magic | wc -l
