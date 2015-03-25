#!/bin/bash
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz -O - | gunzip -c > /usr/share/GeoIP/GeoIP.dat
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz -O - | gunzip -c > /usr/share/GeoIP/GeoIPCity.dat
service php5-fpm restart
