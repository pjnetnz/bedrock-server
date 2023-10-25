FROM ubuntu:jammy

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 libssl3
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.40.01.zip --output bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip

RUN mv bedrock-server/server.properties bedrock-server/config/server.properties
RUN mv bedrock-server/permissions.json bedrock-server/config/permissions.json
RUN mv bedrock-server/allowlist.json bedrock-server/config/allowlist.json
RUN ln -s config/server.properties bedrock-server/server.properties
RUN ln -s config/permissions.json bedrock-server/permissions.json
RUN ln -s config/allowlist.json bedrock-server/allowlist.json


WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
