FROM gcr.io/cloud-datalab/datalab:latest

COPY setup.sh /tmp/setup.sh
RUN source /tmp/setup.sh

COPY requirements.txt /tmp/requirements.txt
RUN source activate py3env && pip install --upgrade --requirement /tmp/requirements.txt

WORKDIR /content/datalab

COPY startup.sh /startup.sh
ENTRYPOINT ["/startup.sh"]
