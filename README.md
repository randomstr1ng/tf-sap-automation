# Terraform SAP Automation
Collection of Terraform scripts to automate the deployment of SAP Systems and components like SAPRouter and SAP Cloud Connector

> [!WARNING]
> The Installation of the components runs in the background and take some time. Either check the logfile `/var/log/cloud-init-output.log` or the status of the service itself.

At the moment the following SAP Components are supported:
- SAPRouter
- SAP Cloud Connector

At the moment the following Cloud Providers are supported:
- AWS