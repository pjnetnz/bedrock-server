FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 libssl1.0.0
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.40.02.zip --output bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip
RUN cd bedrock-server
RUN mv server.properties server.properties.default
RUN mv permissions.json permissions.json.default
RUN mv whitelist.json whitelist.json.default
RUN ln -s server.properties config/server.properties
RUN ln -s permissions.json config/permissions.json
RUN ln -s whitelist.json config/whitelist.json


WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
