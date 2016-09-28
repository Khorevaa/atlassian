FROM relateiq/oracle-java8

ENV BITBUCKET_VERSION 4.8.3
ENV BITBUCKET_HOME /opt/bitbucket-home
ENV HOME /opt/bitbucket-home
ENV JVM_SUPPORT_RECOMMENDED_ARGS -Djava.security.egd=file:/dev/./urandom

RUN apt-get update -y && \
    apt-get install git -y

RUN mkdir /opt/bitbucket && \
    mkdir /opt/bitbucket-home
RUN wget -O - \
      http://www.atlassian.com/software/stash/downloads/binary/atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/bitbucket \
    && perl -i -p -e 's/^JVM_SUPPORT/#JVM_SUPPORT/' /opt/bitbucket/bin/setenv.sh \
    && perl -i -p -e 's/^# umask 0027/umask 0027/'  /opt/bitbucket/bin/setenv.sh

WORKDIR /opt/bitbucket
VOLUME ["/opt/bitbucket-home"]

CMD ["/opt/bitbucket/bin/catalina.sh", "run"]
