#!/bin/bash

USER=beny.putra

echo "Starting backup your fucking site" \
    && mkdir -p /home/$USER/projectku/backupsql \
    && docker exec -i mysql mysqldump -u root -pinipasswordrootanjing wordpress > /home/$USER/projectku/backupsql/wordpress_"`date +"%d-%m-%Y"`".sql \
    && echo "Done wordpress backup" \
    && docker exec -i mysql mysqldump -u root -pinipasswordrootanjing forum > /home/$USER/projectku/backupsql/forum_"`date +"%d-%m-%Y"`".sql \
    && cd /home/$USER/projectku/ && tar czfv sqlbackup"`date +"%d-%m-%Y"`".tar.gz backupsql && rm -f backupsql/* && mv sqlbackup"`date +"%d-%m-%Y"`".tar.gz backupsql \
    && cd /home/$USER/ && tar czfv wwwdata_"`date +"%d-%m-%Y"`".tar.gz projectku && mv wwwdata_"`date +"%d-%m-%Y"`".tar.gz /home/$USER/GoogleDrive/Project/ \
    && cd /home/$USER/projectku && rm -f sqlbackup"`date +"%d-%m-%Y"`".tar.gz \
    echo "done for everything" \
exit 0
