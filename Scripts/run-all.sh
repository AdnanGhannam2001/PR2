#!/bin/bash

dotnet dev-certs https --clear --trust
dotnet run --project Applications/AuthorizationService/src/AuthorizationServer/ & \
dotnet run --project Applications/SocialMediaService/src/SocialMediaService.WebApi -lp https & \
dotnet run --project Applications/ChatService/src/ChatService.csproj -lp https -p:DefineConstants=NO_RABBIT_MQ