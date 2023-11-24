#
ROOT := "/terrash"
TERRADOWNLOAD := "https://developer.hashicorp.com/terraform/install"
SSHOPTS := -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
TERRAWK ?= $(ROOT)/terraform.awk
TERRAVERS := $$(cat $(ROOT)/terraform.version )

$(ROOT)/terraform.site:
	@wget -O - -q $(TERRADOWNLOAD) > $@ || { rc=$$?; rm -f $@; exit $$rc; }

$(ROOT)/terraform.version: $(ROOT)/terraform.site
	@wget -O - -q $(TERRADOWNLOAD) | awk -f $(TERRAWK) > $@ || { rm -f $@; exit 1; }

version: $(ROOT)/terraform.version
	@echo $(TERRAVERS)

# https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip
TERRAURL = https://releases.hashicorp.com/terraform/$(TERRAVERS)/terraform_$(TERRAVERS)_linux_amd64.zip

# download and "install" terraform
terraform: $(ROOT)/terraform.version
	@wget -q -O terraform.zip $(TERRAURL) && unzip -q terraform.zip && chmod +x terraform && rm -f terraform.zip
