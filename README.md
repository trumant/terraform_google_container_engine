# Kubernetes on Google Cloud Platform

## Dependencies

 * Create a [Google Cloud](https://cloud.google.com/) account and project
 * Enable the Google Compute Engine and Google Container Engine APIs from
   Google Cloud Dashboard > API Manager > Dashboard
 * Download your API credentials from Google Cloud Dashboard > API Manager >
   Credentials. You want a Service account key.
 * Install the [Google Cloud SDK](https://cloud.google.com/sdk/)
 * Download [Terraform](https://www.terraform.io/downloads.html), 
   `tar -xf ~/Downloads/terraform*.zip` and
   `cp ~/Downloads/terraform /usr/local/bin`

This Terraform configuration depends upon the following environment variables:

 * GOOGLE_CREDENTIALS
 * GOOGLE_PROJECT
 * GOOGLE_REGION

## Plan

Terraform will show you which resources it plans to create and a tidy little
summary like: `Plan: 1 to add, 0 to change, 0 to destroy.`

### Example

```shell
GOOGLE_CREDENTIALS=$(cat ~/google_credentials.json) \
GOOGLE_PROJECT="spheric-gasket-163915" \
GOOGLE_REGION="us-central1" \
terraform plan
```

## Apply

Terraform will create the Kubernetes cluster in Google Cloud and output
the IP address of the cluster, as well as the certificates and key needed
to configure `kubectl` to communicate with the cluster.

### Example

```shell
GOOGLE_CREDENTIALS=$(cat ~/google_credentials.json) \
GOOGLE_PROJECT="spheric-gasket-163915" \
GOOGLE_REGION="us-central1" \
terraform apply
```

## Destroy

Remove all of the infrastructure resources created by Terraform

### Example

```shell
GOOGLE_CREDENTIALS=$(cat ~/google_credentials.json) \
GOOGLE_PROJECT="spheric-gasket-163915" \
GOOGLE_REGION="us-central1" \
terraform destroy
```