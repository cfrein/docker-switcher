# Switcher
#
# VERSION               0.2

FROM      dockerfile/python
MAINTAINER Claus Frein <frein@gmx.de>

ADD https://github.com/cfrein/python-switcher/archive/master.tar.gz /tmp/
WORKDIR /src
RUN tar xzf /tmp/master.tar.gz && \
    rm /tmp/master.tar.gz && \
    mv python*/* /src/

ADD set_environment.sh /src/
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN chmod a+rx /src/set_environment.sh; \
    source /src/set_environment.sh; \
    set|grep proxy; \
    pip install -r /src/requirements.txt

EXPOSE 5000
CMD    ["python","switcher.py"]
