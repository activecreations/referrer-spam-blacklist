#!/bin/bash

# Make sure file exists.
touch referer_spam.conf

# Empty out file.
> referer_spam.conf

# Loop spammers list and append a line for each host.
sort spammers.txt | uniq | sed 's/\./\\\\./g' | while read host; 
do 
    echo "if (\$http_referer ~ '$host') {return 403;}" >> referer_spam.conf
done;