#!/bin/bash

dotnet dev-certs https --clear --trust
dotnet run --project apps/AuthorizationService/src/AuthorizationServer/ & \
dotnet run --project apps/SocialMediaService/src/SocialMediaService.WebApi -lp https & \
dotnet run --project apps/ChatService/src/ChatService.csproj -lp https -p:DefineConstants=NO_RABBIT_MQ