# based on raspbian stretch
FROM sgub/rpi-rtlsdr-base

MAINTAINER Yao Leilei

RUN apt-get update
RUN apt-get install -y build-essential libasound2-dev libgps-dev

RUN cd ~ \
&& git clone https://www.github.com/wb2osz/direwolf \
&& cd ~/direwolf \
&& make \
&& sudo make install

RUN apt-get remove build-essential libasound2-dev libgps-dev
RUN apt-get clean

COPY sdr-igate.conf.template ./
COPY run.sh ./

CMD ./run.sh
