FROM frolvlad/alpine-glibc:alpine-3.7

ENV GRAAL_VER=1.0.0-rc1
ENV JAVA_HOME=/usr/lib/jvm/graalvm-${GRAAL_VER}
ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN apk add --no-cache --virtual=.build-dependencies curl \
    && mkdir -p /usr/lib/jvm \
    && curl -sSL https://github.com/oracle/graal/releases/download/vm-${GRAAL_VER}/graalvm-ce-${GRAAL_VER}-linux-amd64.tar.gz \
      | tar -xzC /usr/lib/jvm \
    && rm ${JAVA_HOME}/src.zip \
    && apk del --purge .build-dependencies
