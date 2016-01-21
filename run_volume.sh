docker run -d -p 8090:80 -p 3306:3306 -v $(pwd)/www:/var/www ludo/nginx-fpm:centos6
