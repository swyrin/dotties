#!/bin/sh
echo $(sensors | cut -c 17-20 | sed -n '3p')
