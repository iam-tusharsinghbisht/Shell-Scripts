#!/bin/bash

# This script create a backup of dir and implements rotation only keeping latest 5 backups.

display_usage(){
	echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

if [ $# -ne 2 ]; then
	echo "Insufficient arguments provided, please follow below usage!"
	display_usage
fi

source_dir=$1
backup_dir=$2
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

create_backup(){
	echo "Creating backup"
	zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}"
	if [ $? -eq 0 ]; then
		echo "Backup generated successfully for ${source_dir} at ${timestamp} ; Backup Location: ${backup_dir}"
	fi
}

perform_rotation(){
	backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))

	if [ ${#backups[@]} -gt 5 ]; then
		echo "Performing rotaion for backups"

		backups_to_remove=(${backups[@]:5})
		for backup in "${backups_to_remove[@]}"; do
			echo "Removing old backup: $backup"
			rm -f ${backup}
		done
	fi
}

echo "***********Task execution begins*************"
create_backup
perform_rotation
echo "***********Task execution ends***************"


