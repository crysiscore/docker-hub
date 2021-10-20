
#################### OpenMRS Backup Script ##############################################
# Created by: Colaco Nhongo
# Modified by; Agnaldo Samuel
# Modification date: 04/2018
# Desc: Backups openmrs database

data=`date '+%Y-%m-%d'`
us_name='maio'
backup_location='/home/ccsadmin/openmrs/backups/maio'
sep='_'
backup_link=$us_name$sep$data.sql
zip_file=$us_name$sep$data.zip

cd $backup_location

/usr/bin/mysqldump --column-statistics=0  -uroot -ppassword  -h 127.0.0.1 -P 5457 1_maio > $backup_link  &&  zip   $zip_file  $backup_link 


mysql -uroot -ppassword -h 127.0.0.1 -e  "drop database if exists maio; create database maio;"

mysql -uroot -ppassword   -h 127.0.0.1 -f   maio <  $backup_link  

if [ $? -eq 0 ]; then
   echo "Backup import $us_name  OK"
   rm -f  $backup_link
   mysql -uroot -ppassword -h 127.0.0.1 maio  <   ../scripts/change_admin_pass.sql
   docker stop  maio
   docker start maio
else
   echo "Backup do dia $data esta corrompido.!" >> log.txt
fi



