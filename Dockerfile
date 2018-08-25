FROM ubuntu:16.04

# Set the working directory to /app
WORKDIR /corebuild

# Copy the current directory contents into the container at /app
ADD ./corebuild/ /corebuild

RUN yum update -y
RUN yum install python36 -y
RUN python3 -m pip install boto3
RUN python3 -m pip install awscli
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get update
RUN apt-get install awscli jq -y
RUN apt-get install apt-get install python3.6 -y
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https -y
RUN apt-get update
RUN apt-get install dotnet-sdk-2.1 -y