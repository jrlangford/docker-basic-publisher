#This Dockerfile provisions a container designed to send simple messages
#to a RabbitMQ server
FROM centos
MAINTAINER jonathan.langford@schibsted.com.mx

#Base packages
RUN yum install -y ruby
RUN gem install bunny --version ">= 1.6.0"
ADD send.rb /tmp/
