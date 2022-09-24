#!/bin/sh
echo $(sensors | cut -c 16-17 | sed -n '3p')
