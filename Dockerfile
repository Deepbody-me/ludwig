#
# Ludwig Docker image with full set of pre-requiste packages to support these capabilities
#   text features
#   image features
#   audio features
#   visualizations
#   model serving
#

FROM tensorflow/tensorflow:1.15.2-gpu-py3

RUN apt-get -y update && apt-get -y install git libsndfile1

RUN git clone --depth=1 https://github.com/uber/ludwig.git \
    && cd ludwig/ \
    && pip install -r requirements.txt -r requirements_text.txt \
          -r requirements_image.txt -r requirements_audio.txt \
          -r requirements_serve.txt -r requirements_viz.txt \
    && python setup.py install

WORKDIR /data

ENTRYPOINT ["ludwig"]
