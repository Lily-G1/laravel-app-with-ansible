#!/bin/bash
# Script to install & configure PostgreSQL on Debian 11

PSQL_CONF=/etc/postgresql/13/main/postgresql.conf
PSQL_CONF_BKUP=/etc/postgresql/13/main/postgresql_conf_backup
PSQL_HBA=/etc/postgresql/13/main/pg_hba.conf
PSQL_HBA_BKUP=/etc/postgresql/13/main/pg_hba_conf_backup


# Ensures the server is up to date before proceeding
echo "Updating system..." &&
#sudo apt update &&

#sudo apt upgrade &&


# Installs PostgreSQL
echo "Installing PostgreSQL..." &&
sudo apt install postgresql postgresql-contrib -y &&


# Ensures the PostgreSQL service is enabled at boot-up & running
sudo systemctl start postgresql &&

sudo systemctl enable postgresql &&


# Creates back-up copy of default postgresql config file
if [ ! -e PSQL_CONF_BKUP ];
then
	sudo cp $PSQL_CONF $PSQL_CONF_BKUP
fi


# Edits postgresql config file to allow all connections
sudo sed -i '/listen_addresses/s/^#//g' $PSQL_CONF &&

sudo sed -i 's/localhost/*/' $PSQL_CONF &&


# Creates back-up copy of default postgresql hosts config file
if [ ! -e PSQL_HBA_BKUP ];
then
	sudo cp $PSQL_HBA $PSQL_HBA_BKUP
fi


# Edits postgresql host config file to allow all connections
echo "host	all		all		0.0.0.0/0		md5" | sudo tee -a $PSQL_HBA &&


# Restarts postgresql service to accept changes
sudo systemctl restart postgresql