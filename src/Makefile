#
TERRADOWNLOAD := "https://developer.hashicorp.com/terraform/install"
SSHOPTS := -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null

TERRAWK ?= /terrash/terraform.awk

TERRAVERS := $$(< terraform.version )

terraform.site:
	wget -O - -q $(TERRADOWNLOAD) > $@ || { rc=$$?; rm -f $@; exit $$rc; }

terraform.version:
	@wget -O - -q $(TERRADOWNLOAD) | awk -f $(TERRAWK) > $@ || { rm -f $@; exit 1; }

version:
	@echo $(TERRAVERS)

# https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip
TERRAURL = https://releases.hashicorp.com/terraform/$(TERRAVERS)/terraform_$(TERRAVERS)_linux_amd64.zip

# download and "install" terraform
terraform:
	@wget -q -O terraform.zip $(TERRAURL) && unzip -q terraform.zip && chmod +x terraform && rm -f terraform.zip
