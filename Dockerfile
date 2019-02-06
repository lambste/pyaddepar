# Set the base image to Ubuntu
FROM continuumio/miniconda3 as builder

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

RUN conda install -q -y nomkl pandas=0.24 requests=2.21.0 && conda clean -y -all

COPY ./pyaddepar /pyaddepar/pyaddepar

WORKDIR /pyaddepar

FROM builder as test

# this is used to mock http for testing
RUN pip install httpretty pytest pytest-cov pytest-html sphinx requests-mock
COPY ./test   /pyaddepar/test
CMD py.test --cov=pyaddepar  --cov-report html:artifacts/html-coverage --cov-report term --html=artifacts/html-report/report.html test