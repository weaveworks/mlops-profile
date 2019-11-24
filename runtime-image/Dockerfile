FROM tensorflow/tensorflow:1.14.0-py3
COPY requirements.txt /requirements.txt
RUN  pip3 install -r /requirements.txt
RUN  pip3 install https://storage.googleapis.com/ml-pipeline/release/latest/kfp.tar.gz --upgrade
