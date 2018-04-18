# Build / run:
# docker build --tag="${PWD##*/}" .
# docker run --tty --interactive --volume "${PWD}":/opt/project --publish=8000:8000 "${PWD##*/}"
# docker run --tty --interactive --volume "${PWD}":/opt/project --entrypoint="bash" "${PWD##*/}"
# Cleanup:
# docker rm $(docker ps --all --quiet)
# docker rmi $(docker images --quiet --filter "dangling=true")
# docker volume rm $(docker volume ls --quiet)


FROM ubuntu:16.04

ENV last_update 20180213


# Install required packages

RUN apt-get update --quiet --yes && apt-get install --quiet --yes --force-yes ca-certificates \
    python-dev \
    python-pip \
    python-setuptools \
    #curl \
    #unzip \
    git \ 
    python

# Install required packages
ADD requirements.txt /root/requirements.txt
RUN pip install --upgrade pip 
RUN pip install --upgrade setuptools urllib3[secure]
RUN pip install -r /root/requirements.txt

# These are stored in https://chromedriver.storage.googleapis.com/index.html
# from time to time they will need to be updated
#ENV CHROMEDRIVER_VERSION 2.35
#ENV CHROMEDRIVER_SHA256 67fad24c4a85e3f33f51c97924a98b619722db15ce92dcd27484fb748af93e8e

#RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
#  && echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - \
#  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
#  && rm "chromedriver_linux64.zip"

# Configure environment
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONWARNINGS d

# Entrypoint
# Also need
EXPOSE 8000-8100
WORKDIR /opt/project/checkers
ENTRYPOINT ["/opt/project/run-django"]
CMD ["check"]
