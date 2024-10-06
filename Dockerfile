FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

WORKDIR /pr2

RUN apt-get update && \
    apt-get install -y libnss3-tools && \
    apt-get install -y make && \
    apt-get install -y psmisc

COPY ./Scripts ./Scripts
RUN chmod +x ./Scripts/devcert.sh
RUN ./Scripts/devcert.sh

COPY Makefile Makefile
COPY ./Packages/ ./Packages/

RUN make DOCKER=1 build-packages
RUN make DOCKER=1 copy-packages

COPY . .

CMD ["make", "DOCKER=1", "init-dbs", "run"]
