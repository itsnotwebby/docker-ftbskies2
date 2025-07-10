# syntax=docker/dockerfile:1

FROM openjdk:21-buster

LABEL version="1.3.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Skies 2"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/49/4951517d1bd2376e48d280427f95fd313c7aa778bddff582296651cfae7d7a9a.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBSkies:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Skies v1.3.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]
