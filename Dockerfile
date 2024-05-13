FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

WORKDIR /pr2

COPY ./scripts/ ./scripts/
COPY ./packages/ ./packages/

RUN chmod +x ./scripts/*
RUN ./scripts/build-packages.sh
RUN ./scripts/collect-packages.sh

COPY . .

# Authorization Service
WORKDIR /pr2/apps/AuthorizationService
RUN dotnet restore

# Main Service
WORKDIR /pr2/apps/SocialMediaService
RUN dotnet restore

# Chat Service
WORKDIR /pr2/apps/ChatService
RUN dotnet restore

WORKDIR /pr2

CMD ./scripts/run-all.sh

# TODO: Publish Release