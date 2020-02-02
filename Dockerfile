FROM tensorflow/tensorflow:1.15.2-gpu-py3
# FROM nvcr.io/nvidia/tensorrt:20.01-py3

RUN mkdir -p /app
WORKDIR /app

# ENV LD_LIBRARY=/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64
# # Install TensorRT. Requires that libcudnn7 is installed above.
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     libnvinfer6=6.0.1-1+cuda10.2 \
#     libnvinfer-dev=6.0.1-1+cuda10.2 \
#     libnvinfer-plugin6=6.0.1-1+cuda10.2

COPY requirements.txt /app
RUN pip install -r requirements.txt

# COPY . /app
EXPOSE 9000
CMD ["python3","./http_server.py"]