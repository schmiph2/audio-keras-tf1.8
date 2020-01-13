FROM  tensorflow/tensorflow:1.15.0-gpu-jupyter

ARG DEBIAN_FRONTEND=noninteractive

# Update List of avai. Packages and intall additional packages
RUN apt-get update && apt-get -y install \
			python3-tk \
	&& rm -rf /var/lib/apt/lists/* #cleans up apt cache -> reduces image size
RUN pip install --upgrade pip	
RUN apt-get  -y install tzdata
RUN apt-get -y install python3-dev
RUN apt-get update && apt-get install -y git
RUN apt-get -y install htop
RUN apt-get -y install graphviz
RUN pip3 install --upgrade -I setuptools
RUN pip3 install -Iv keras==2.2.4 	
RUN pip3 install \
  jupyter \
  matplotlib \
  seaborn	\
  Image \
  scikit-learn \
  lxml \
  joblib \
  h5py \
  python_speech_features \
  sox \
  librosa \
  SpeechRecognition \
  spectrum \
  tqdm \
  cython \
  pydot \
  pydotplus\
  graphviz \
  nvidia-ml-py3 \
  
RUN pip3 install https://github.com/schmiph2/pystoi/archive/master.zip
RUN pip3 install https://github.com/schmiph2/python-pesq/archive/master.zip
RUN pip3 install https://github.com/schmiph2/pysepm/archive/master.zip

RUN pip3 install pysptk  
RUN pip3 install samplerate
RUN add-apt-repository ppa:jonathonf/ffmpeg-4
RUN apt-get update
RUN apt-get -y install ffmpeg && apt-get -y install libavcodec-extra 
RUN apt-get -y install sox

VOLUME /src
WORKDIR /src
EXPOSE 8888
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root
