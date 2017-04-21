https://gist.github.com/xdamman/e4f713c8cd1a389a5917
https://github.com/swooningfish/ffmpeg-web-gui/blob/master/upload-and-convert.php
https://dpkarthi.wordpress.com/2013/08/01/install-ffmpeg-qt-faststart/

sudo apt-get -y install apache2 && \
cat >/etc/nginx/sites-available/myconfig.conf <<EOL

<VirtualHost *>
	    ServerAdmin buddhika.anushka.lk
        ServerName chat.1plus-agency.com
        ServerAlias chat.1plus-agency.com
        DocumentRoot /var/www/converter
        AddType  application/x-httpd-php         .php
        AddType  application/x-httpd-php-source  .phps
        LoadModule php5_module modules/libphp5.so
        LoadModule php5_module modules/libphp5-zts.so
	    LoadModule proxy_module modules/mod_proxy.so
        LoadModule proxy_http_module modules/mod_proxy_http.so



        <Directory /var/www/converter>
         AllowOverride All
         Options Indexes FollowSymLinks Includes ExecCGI
         Order Allow,Deny
         Allow from All
         Require all granted
        </Directory>

</VirtualHost>

EOL
ln -s /etc/apache2/sites-available/converter.conf  /etc/apache2/sites-enabled/converter.conf
sudo apt-get -y install libapache2-mod-php5 && a2enmod proxy_http && \
sudo apt-get -y install subversion &&\
svn checkout svn://svn.ffmpeg.org/ffmpeg/trunk ffmpeg && \
cd ffmpeg && \
./configure && \
make && \
make tools/qt-faststart && \
cp -a tools/qt-faststart /usr/bin/





