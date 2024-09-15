#!/bin/bash

dir="_posts"
for file in ${dir}/*.md; do
    content=$(grep -m 1 'date: ' "${file}")
    datestr=$(echo "$content" | awk '{print $2" "$3}')
    newcontent="updated: $datestr"
    sed -i "/$content/a $newcontent" "${file}"
done

