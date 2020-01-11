FROM gcr.io/cloud-datalab/datalab:latest_test

RUN apt-get update
RUN apt-get install -y htop psmisc tmux vim zsh
RUN gcloud components update --quiet

COPY requirements.txt /tmp/requirements.txt
RUN rm -rf /usr/local/envs/py3env/lib/python3.5/site-packages/dill*
RUN rm -rf /usr/local/envs/py3env/lib/python3.5/site-packages/seaborn*
RUN source activate py3env && pip install --upgrade pip
RUN source activate py3env && pip install --upgrade --requirement /tmp/requirements.txt

COPY run.sh /run.sh
ENTRYPOINT /run.sh
