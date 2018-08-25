FROM ubuntu:16.04

# Set the working directory to /app
WORKDIR /corebuild

# Copy the current directory contents into the container at /app
ADD ./corebuild/ /corebuild

RUN apt-get update
RUN apt-get install software-properties-common wget -y
RUN apt-get update
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https -y
RUN apt-get update
RUN apt-get install dotnet-sdk-2.1 -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.6 -y