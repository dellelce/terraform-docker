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
