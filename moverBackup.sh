#!/bin/bash

USER=beny.putra

echo "Starting backup your fucking site" \
    && docker exec -i wordpress_db mysqldump -u root -proot wordpress > /home/$USER/projectku/backupsql/wordpress_"`date +"%d-%m-%Y"`".sql \
    && echo "Done" \
    && docker exec -i wordpress_db mysqldump -u root -proot forum > /home/$USER/projectku/backupsql/forum_"`date +"%d-%m-%Y"`".sql \
    && cd /home/$USER/projectku/ && tar czfv sqlbackup"`date +"%d-%m-%Y"`".tar.gz backupsql && rm -f backupsql/* \
    && cd /home/$USER/ && tar czfv wwwdata_"`date +"%d-%m-%Y"`".tar.gz projectku && mv wwwdata_"`date +"%d-%m-%Y"`".tar.gz /home/$USER/GoogleDrive/Project/ \
    && cd /home/$USER/projectku && rm -f sqlbackup"`date +"%d-%m-%Y"`".tar.gz \
    echo "done for everything" \
exit 0

