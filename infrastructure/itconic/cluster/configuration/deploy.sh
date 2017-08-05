#!/bin/bash

echo -e "\n## trax1 ##\n"
scp -r trax1/etc/* trax1:/etc/
echo -e "\n## trax2 ##\n"
scp -r trax2/etc/* trax2:/etc/
echo
