#! /bin/bash

file=$1
backup_dir=${2:-/tmp/important/backup}

if [ ! -d "$backup_dir" ]; then
    mkdir -p $backup_dir
fi

checksum_file=$(sha256sum $file | awk '{print $1}')
echo "[INFO] checksum_file = $checksum_file"

previous_backups=$(ls $backup_dir)
if [ -z "$previous_backups" ]; then
    echo "No previous backup"
    new_file_name=$(date +"%Y-%m-%d-%H-%M-%S")
    cp $file $backup_dir/$new_file_name
    echo "Backup completed: See $backup_dir/$new_file_name"
    exit 0
fi

for prev_backup in $previous_backups;do
    checksum=$(sha256sum $backup_dir/$prev_backup | awk '{print $1}')
    echo $checksum for file $prev_backup
    if [ "$checksum" == "$checksum_file" ]; then
        # rename backup file
        echo "Rename previous backup"
        exit 0
    fi
done 

new_file_name=$(date +"%Y-%m-%d-%H-%M-%S")
cp $file $backup_dir/$new_file_name
echo "Backup completed: See $backup_dir/$new_file_name"
exit 0
