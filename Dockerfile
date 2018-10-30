FROM gcr.io/cloud-datalab/datalab:latest

RUN apt-get update
RUN apt-get install -y htop tmux vim

COPY requirements.txt /tmp/requirements.txt
RUN rm -rf /usr/local/envs/py3env/lib/python3.5/site-packages/seaborn*
RUN source activate py3env && pip install --upgrade --requirement /tmp/requirements.txt

WORKDIR /content/datalab

COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]
