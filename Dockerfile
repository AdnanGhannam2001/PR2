FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

WORKDIR /pr2

COPY Makefile Makefile
COPY ./Packages/ ./Packages/

RUN apt-get update && \
    apt-get install -y make

RUN make DOCKER=1 build-packages
RUN make DOCKER=1 copy-packages

COPY . .

RUN make DOCKER=1 restore
RUN make DOCKER=1 init-dbs
RUN make DOCKER=1 run
