# Use an official Debian runtime as a base image
FROM debian:buster
MAINTAINER Yann Pouillon "yann.pouillon@materialsevolution.es"

# Set the working directory to /app
WORKDIR /siesta

# Copy the current directory contents into the container at /app
ADD . /siesta

# Prepare the environment
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install apt-utils locales -y && apt upgrade -y
RUN echo "LC_ALL=\"C.UTF-8\"" >>/etc/default/locale
RUN locale-gen C.UTF-8 && update-locale LANG="C.UTF-8"

# Install the required development packages
RUN /bin/bash -c "xargs -a <(awk '/^\s*[^#]/' packages.txt) -r -- apt install -y"

# Install any needed packages specified in requirements.txt
RUN pip3 install --upgrade pip
RUN pip install --upgrade wheel
RUN pip install -r requirements.txt
RUN pip install --upgrade git+https://gitlab.com/ase/ase.git@master

# Build the currently available versions of SIESTA
RUN git clone https://gitlab.com/siesta-project/siesta.git /siesta/trunk
RUN /bin/bash /siesta/install-siesta-4.0.2.sh

# Define container name
ENV NAME siesta-runner

# Open a terminal when the container launches
CMD ["/bin/bash", "-login"]
