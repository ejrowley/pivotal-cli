#!/bin/bash

TOKEN=XXXXXXXXXXXXXXXX
PROJECT_ID=XXXXXX

type=bug
if (($# > 0)); then
    type=$1
fi


stories=`curl -s -H "X-TrackerToken: $TOKEN" -X GET http://www.pivotaltracker.com/services/v3/projects/$PROJECT_ID/stories\?filter\=type%3A$type%20state%3Aunstarted`
echo $stories | xml sel -t -m //story -v "concat(id,': ',name)" -n
