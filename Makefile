.PHONY: init plan deploy show

init:
	terraform init -reconfigure -lock=false

plan:
	terraform plan

deploy:
	terraform apply -auto-approve

validate:
	terraform validate

destroy:
	terraform apply -destroy

refresh:
	terraform refresh

lint:
	terraform fmt -recursive
