FROM centos
MAINTAINER Sthapaun Patinthu <contact@sthapaun.com>


# Install emacs
RUN yum update; yum -y install emacs; yum -y install wget; yum -y install zip; yum -y install unzip; cd ~/; mkdir Desktop; cd Desktop; wget https://storage.googleapis.com/ddd-cdn/dev/editors/emacs.tar.gz; tar -zxvf emacs.tar.gz; cd emacs; cp emacs ~/.emacs; cp -r emacs.d ~/.emacs.d; rm ~/Desktop/emacs.tar.gz; rm -r ~/Desktop/emacs; echo 'export TERM="xterm"' >> ~/.bashrc;

# Install node using EPEL repository.
RUN cd ~/; mkdir /code; wget https://nodejs.org/dist/v4.1.0/node-v4.1.0-linux-x64.tar.gz; tar -zxvf node-v4.1.0-linux-x64.tar.gz; mv node-v4.1.0-linux-x64 node; cd node; yum -y install gcc gcc-c++; cp -r bin/* /bin; node --version; cd /code; echo 'var http = require("http");' > server.js; echo 'http.createServer(function(request, response) {' >> server.js; echo 'response.writeHead(200, {"Content-Type": "text/plain"});' >> server.js; echo 'response.write("Hello World");' >> server.js; echo 'response.end();' >> server.js; echo '}).listen(8080);' >> server.js; 

EXPOSE 8080

CMD ["node", "/code/server.js"]