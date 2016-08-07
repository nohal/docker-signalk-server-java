FROM       anapsix/alpine-java:8_server-jre
MAINTAINER Pavel Kalian "https://github.com/nohal"

RUN apk update; \
  apk add ca-certificates wget; \
  wget http://apache.dattatec.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz; \
  tar zxf apache-maven-3.3.9-bin.tar.gz; \
  rm -rf apache-maven-3.3.9-bin.tar.gz; \
  mv apache-maven-3.3.9 /opt; \
  echo 'PATH=/opt/apache-maven-3.3.9/bin:$PATH' > /etc/profile.d/maven.sh; \
  source /etc/profile

RUN wget https://github.com/SignalK/signalk-java/archive/master.tar.gz; \
    tar zxf master.tar.gz; \
    rm master.tar.gz; \
    sed -i -e "s/bash/sh/g" signalk-java-master/startpc.sh; \
    mv signalk-java-master /opt; \
    cd /opt/signalk-java-master; \
    source /etc/profile; \
    mvn compile exec:java -Dexec.skip=true

COPY signalk-server-java.sh /usr/local/bin/

EXPOSE 1883 3000 8080 55554 55555 55556 55557 61613
ENTRYPOINT ["signalk-server-java.sh"]
