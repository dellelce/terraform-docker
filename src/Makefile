#
TERRADOWNLOAD := "https://developer.hashicorp.com/terraform/downloads"
SSHOPTS := -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null

TERRAVERS = $$(wget -O - -q $(TERRADOWNLOAD) | awk -f /terrash/terraform.awk  )
LTERRAVERS = $$(./terraform version | awk 'FNR == 1 { sub(/^v/, "", $$2); print $$2 } ' )
# https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip
TERRAURL = https://releases.hashicorp.com/terraform/$(TERRAVERS)/terraform_$(TERRAVERS)_linux_amd64.zip

# download and "install" terraform
terraform:
	@wget -q -O terraform.zip $(TERRAURL) && unzip -q terraform.zip && chmod +x terraform && rm -f terraform.zip

# test target: get current version of terraform from website
terravers:
	@echo "terraform  " $(TERRAVERS)

localtvers:
	@echo $(LTERRAVERS)

terraupclean:
	@[ $(LTERRAVERS) != $(TERRAVERS) ] && rm terraform

# update terraform:
#   - delete local binary if local version is different from available online
#   - download new terraform if previous step executed
terraup: terraupclean terrabin

ALLVERS += terravers

init: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) init

plan: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) plan

apply_force: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) apply -auto-approve -input=false

destroy: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) destroy

output: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) output

show: terrabin
	@cd $(TERRAHOME) && $(TERRAFORM) show

console: terrabin
	@cd terraform && $(TERRAFORM) console

ssh: terrabin
	@ssh -i terraform/ec2.key $(SSHOPTS) $(SYSUSER)@$(ip)
