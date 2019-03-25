CHART_REPO := http://jenkins-x-chartmuseum:8080
NAME := environment-controller
OS := $(shell uname)

CHARTMUSEUM_CREDS_USR := $(shell cat /builder/home/basic-auth-user.json)
CHARTMUSEUM_CREDS_PSW := $(shell cat /builder/home/basic-auth-pass.json)

init: 
	helm init --client-only

setup: init
	helm repo add jenkins-x http://chartmuseum.jenkins-x.io 	

build: clean setup
	helm dependency build environment-controller
	helm lint environment-controller

install: clean build
	helm upgrade ${NAME} environment-controller --install

upgrade: clean build
	helm upgrade ${NAME} environment-controller --install

delete:
	helm delete --purge ${NAME} environment-controller

clean:
	rm -rf environment-controller/charts
	rm -rf environment-controller/${NAME}*.tgz
	rm -rf environment-controller/requirements.lock

release: clean build
ifeq ($(OS),Darwin)
	sed -i "" -e "s/version:.*/version: $(VERSION)/" environment-controller/Chart.yaml

else ifeq ($(OS),Linux)
	sed -i -e "s/version:.*/version: $(VERSION)/" environment-controller/Chart.yaml
else
	exit -1
endif
	helm package environment-controller
	curl --fail -u $(CHARTMUSEUM_CREDS_USR):$(CHARTMUSEUM_CREDS_PSW) --data-binary "@$(NAME)-$(VERSION).tgz" $(CHART_REPO)/api/charts
	rm -rf ${NAME}*.tgz
