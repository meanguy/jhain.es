ENV ?= prod

.PHONY: all
all: install build

.PHONY: ansible
ansible:
	cd deploy/ansible \
	&& ansible-playbook main.yml

.PHONY: ansible-galaxy
ansible-galaxy:
	ansible-galaxy install \
		geerlingguy.certbot

.PHONY: build
build: vue-cli-build

.PHONY: deploy
deploy: terraform-auto-approve ansible

.PHONY: install
install: ansible-galaxy yarn-install

.PHONY: packer
packer: build
	cd deploy/packer \
	&& packer build -var-file=prod.pkrvars.hcl .

.PHONY: serve
serve: vue-cli-serve

.PHONY: terraform
terraform:
	cd deploy/terraform \
	&& terraform apply

.PHONY: terraform-auto-approve
terraform-auto-approve:
	cd deploy/terraform \
	&& terraform plan \
	&& terraform apply \
		-auto-approve

.PHONY: vue-cli-build
vue-cli-build:
	vue-cli-service build \
		--mode "${ENV}"

.PHONY: vue-cli-serve
vue-cli-serve:
	vue-cli-service serve \
		--mode "${ENV}"

.PHONY: yarn-install
yarn-install:
	yarn install
