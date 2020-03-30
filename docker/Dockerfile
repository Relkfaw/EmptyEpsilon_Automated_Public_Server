FROM debian:buster as tmp

RUN apt-get update
RUN apt-get install git build-essential cmake ninja-build zip unzip libsfml-dev -y

RUN git clone https://github.com/daid/EmptyEpsilon.git
RUN git clone https://github.com/daid/SeriousProton.git

RUN mkdir -p /EmptyEpsilon/_build
WORKDIR /EmptyEpsilon/_build/
RUN cmake .. -G Ninja -DSERIOUS_PROTON_DIR=$PWD/../../SeriousProton/
RUN ninja
RUN ninja install


FROM debian:buster

RUN mkdir -p /EmptyEpsilon

COPY --from=tmp /usr/local/share/emptyepsilon/ /usr/local/share/emptyepsilon/
COPY --from=tmp /EmptyEpsilon/_build/EmptyEpsilon /usr/local/share/emptyepsilon/

RUN apt-get update
RUN apt-get install -y libsfml-dev
RUN apt-get install xvfb -y
RUN apt-get install zip -y
RUN apt-get install unzip -y
RUN echo "default-server = unix:/run/user/1000/pulse/native \n autospawn = no \n daemon-binary = /bin/true \n enable-shm = false" > /etc/pulse/client.conf


ENV  DISPLAY :1.0
ADD run.sh /run.sh
ADD EmptyEpsilon_www.zip /EmptyEpsilon_www.zip
RUN unzip /EmptyEpsilon_www.zip -d /usr/local/share/emptyepsilon/


RUN chmod a+x /run.sh
CMD ["/run.sh"]