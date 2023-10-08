# Run Terraform in a Container

Can be used to run terraform, both interactively and not interactively (say in a pipeline), also includes [TFLint](https://github.com/terraform-linters/tflint).

Features:

* Download the latest version of terraform if binary is not found in the `/terraform` path
* Built-in copy of TFLint (currently downloaded at container build time)

## Examples

Basic

```bash
docker run -it --rm  ghcr.io/dellelce/terraform terraform version
```
