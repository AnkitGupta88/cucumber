#!/usr/bin/env bash

update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng > /dev/null 2>&1
apt-get -y update > /dev/null 2>&1

echo installing utility tools
apt-get -y install build-essential libxml2-dev libxslt1-dev ruby-dev

echo installing GIT
apt-get -y install git

echo installing Memcache
apt-get -y install memcached

echo installing Redis
apt-get -y install redis-server

echo installing MySQL
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-server libmysqlclient-dev
mysql -uroot -proot <<SQL
CREATE USER 'rails'@'localhost';
CREATE DATABASE test DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON test.* to 'rails'@'localhost';
SQL

echo installing gems
gem install bundler --no-rdoc --no-ri
bundle install --gemfile=/vagrant/Gemfile
