FROM nvidia/cuda:12.0.0-base-ubuntu22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    espeak-ng \
    curl

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs
RUN git clone https://github.com/yl4579/StyleTTS2.git
RUN git clone https://huggingface.co/yl4579/StyleTTS2-LJSpeech/
RUN ln -s /StyleTTS2-LJSpeech/Models /StyleTTS2/Models
WORKDIR /StyleTTS2
RUN pip3 install -r requirements.txt
RUN pip3 install phonemizer
RUN apt-get -y install sox

ADD tts.py .
RUN python3 -c "import nltk;nltk.download('punkt')"
RUN mkdir /output/
CMD ["python3", "tts.py" ]
