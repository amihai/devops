#! /bin/bash

users=$(cat /etc/group | grep -e "sudo:" | awk -F':' '{print $4}' | tr ',' ' ')

for user in $users; do 
    echo "$user"
done
