#!/bin/bash

touch referer_spam.conf

sort spammers.txt | uniq | sed 's/\./\\\\./g' | while read host; 
do 
    echo "if (\$http_referer ~ '$host') {return 403;}" >> referer_spam.conf
done;