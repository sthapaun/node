FROM centos
MAINTAINER Sthapaun Patinthu <contact@sthapaun.com>


# Install emacs
RUN yum update; yum -y install emacs; yum -y install wget; yum -y install zip; yum -y install unzip; cd ~/; mkdir Desktop; cd Desktop; wget https://storage.googleapis.com/ddd-cdn/dev/editors/emacs.tar.gz; tar -zxvf emacs.tar.gz; cd emacs; cp emacs ~/.emacs; cp -r emacs.d ~/.emacs.d; rm ~/Desktop/emacs.tar.gz; rm -r ~/Desktop/emacs; echo '\n\nexport TERM="xterm"' ~/.bashrc;

# Install node using EPEL repository.
RUN sudo yum install epel-release; sudo yum install nodejs; node --version; sudo yum install npm; echo 'var http = require("http");\n\n' > server.js; echo 'http.createServer(function(request, response) {\n' >> server.js; echo 'response.writeHead(200, {"Content-Type": "text/plain"});\n' >> server.js; echo 'response.write("Hello World");\n' >> server.js; echo 'response.end();\n' >> server.js; echo '}).listen(8080);' >> server.js; 

EXPOSE 8080

CMD ["node", "server.js"]