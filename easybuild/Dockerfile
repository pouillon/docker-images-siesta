# Use an official Python runtime as a base image
FROM debian:jessie

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install required development packages
RUN apt-get update
RUN /bin/bash -c "xargs -a <(awk '/^\s*[^#]/' packages.txt) -r -- apt-get install -y"

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Switch to non-root user (EasyBuild refuses to run as root)
RUN useradd -m -d /app -s /bin/bash easybuild
RUN chown -R easybuild:easybuild /app
USER easybuild

# Build recent EasyBuild environments (will take a long time)
RUN eb foss-2016b -r
RUN eb foss-2017a -r

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
ENV NAME World

# Open a terminal when the container launches
CMD ["/bin/bash", "-login"]
