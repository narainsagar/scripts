#!/usr/bin/env bash

#    purge-apache is a bash script to delete and purge Apache in a server 

#    Copyright (C) 2016 by Ángel Guzmán Maeso, shakaran at gmail dot com

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

service apache2 stop
apt-get remove --purge apache2 apache2-utils apache2.2-bin apache2.4-bin apache2-common -y
apt-get autoremove -y
apt-get autoclean -y
rm -Rf /etc/apache2 /usr/lib/apache2 /usr/include/apache2
