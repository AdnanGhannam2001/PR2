FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

WORKDIR /pr2

COPY ./Scripts/ ./Scripts/
COPY ./Packages/ ./Packages/

RUN chmod +x ./Scripts/*
RUN ./Scripts/build-packages.sh
RUN ./Scripts/collect-packages.sh

COPY . .

# Authorization Service
WORKDIR /pr2/Applications/AuthorizationService
RUN dotnet restore

# Main Service
WORKDIR /pr2/Applications/SocialMediaService
RUN dotnet restore

# Chat Service
WORKDIR /pr2/Applications/ChatService
RUN dotnet restore

WORKDIR /pr2

CMD ./Scripts/run-all.sh

# TODO: Publish Release