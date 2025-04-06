FROM debian

WORKDIR /usr/local/src

RUN apt-get -y update && \
	apt-get -qy install \
		binutils-mips-linux-gnu \
		cpp-mips-linux-gnu \
		python3 \
		python3-pip

COPY . .

RUN pip3 install --break-system-packages --requirement requirements.txt

ENTRYPOINT [ "make" ]
