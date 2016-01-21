# Docker with nginx, php-fpm and mariadb for Centos6 #

This docker reflects the configuration of a certain server I use. It's a bit obsolete but still working and I need to prepare some updates in the contents. So I build this docker machine with nginx, php-fpm and MariaDb, all packed in Centos 6.

I have made two three bash files, one builds the image (build.sh), the other will run the image (run.sh).# docker-nginx-fpm-mariadb-centos6

The third one, called run_volume.sh, will create a volume with the www directory in the project, so you can edit the contents in your favorite editor and try it on the docker machine. Sweeeet!
