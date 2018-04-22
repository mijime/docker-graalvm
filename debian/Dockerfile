FROM debian:sid-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8

RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home

ENV GRAAL_VER 1.0.0-rc1

RUN ln -svT "/usr/lib/jvm/graalvm-${GRAAL_VER}" /docker-java-home
ENV JAVA_HOME /docker-java-home

RUN set -ex; \
	apt-get update; \
	apt-get install -y \
		curl \
	&& rm -rf /var/lib/apt/lists/*; \
  mkdir -p /usr/lib/jvm; \
	curl -sSL https://github.com/oracle/graal/releases/download/vm-${GRAAL_VER}/graalvm-ce-${GRAAL_VER}-linux-amd64.tar.gz \
		| tar -xzC /usr/lib/jvm; \
	rm /docker-java-home/src.zip;
