#
# Ludwig Docker image with basic set of pre-requiste packages
#

FROM tensorflow/tensorflow:latest-py3

RUN apt-get -y update && apt-get -y install git

RUN git clone --depth=1 https://github.com/uber/ludwig.git \
    && cd ludwig/ \
    && pip install -r requirements.txt \
    && python setup.py install

WORKDIR /data

ENTRYPOINT ["ludwig"]
