COMPILER       =dotnet
CONFIGURATION  =Release # TODO
PROJECTS_FLAGS =-lp https

PROJECTS_SLN   =$(shell find ./Applications -name "*.sln")
PROJECTS_CSPROJ=$(shell find ./Applications -name "*.csproj")

PACKAGES_CSPROJ=$(shell find ./Packages -name "*.csproj")
PACKAGES_NUPKG =$(shell find ./Packages -name "*.nupkg")

DOCKER ?=0

ifneq ($(DOCKER), 0)
	PROJECTS_FLAGS +=-p:DefineConstants=DOCKER
endif

all: build-packages copy-packages init-dbs run 

build-packages:
	@for PACKAGE in $(PACKAGES_CSPROJ); do \
		dotnet build $$PACKAGE; \
	done

# TODO: Handle 'Publish'
copy-packages:
	mkdir -p Store

	@for PACKAGE in $(PACKAGES_NUPKG); do \
		PACKAGE_NAME=$(basename -- $$PACKAGE); \
		cp -v $$PACKAGE "./Store/$$PACKAGE_NAME"; \
	done

restore:
	@for SLN in $(PROJECTS_SLN); do \
		dotnet restore $$SLN; \
	done

init-dbs:
	dotnet restore Applications/SocialMediaService/SocialMediaService.sln
	dotnet run --project Applications/SocialMediaService/src/SocialMediaService.WebApi $(PROJECTS_FLAGS) &
	sleep 15
	dotnet run --project Applications/AuthorizationService/src/AuthorizationServer $(PROJECTS_FLAGS) -- --seed
	killall dotnet

	dotnet run --project Applications/SocialMediaService/src/SocialMediaService.WebApi $(PROJECTS_FLAGS) --seed
	dotnet run --project Applications/ChatService/src $(PROJECTS_FLAGS) -- --create-tables --seed
	dotnet run --project Applications/NotificationService/src $(PROJECTS_FLAGS) -- --create-tables

run:
	@for PROJECT in $(PROJECTS_CSPROJ); do \
		dotnet run --project $$PROJECT $(PROJECTS_FLAGS) & \
	done; \
	wait; \
	exec sh

.PHONY: all
