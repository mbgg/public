#!/bin/bash

cd /var/www/html
# other magic methods -> src https://stackoverflow.com/a/39317180
svn export --force https://github.com/guifi-exo/public/trunk/web/matrix.guifi.net
svn export --force https://github.com/guifi-exo/public/trunk/web/riot.guifi.net

chown www-data:www-data -R matrix.guifi.net
chown www-data:www-data -R riot.guifi.net
