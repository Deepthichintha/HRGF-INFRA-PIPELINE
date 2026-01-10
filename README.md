HRGF-INFRA-PIPELINE

Terraform Infrastructure for EKS Pipeline / AWS Networking

This repository contains the Terraform configuration to provision the underlying infrastructure for the HRGF project — including AWS VPC, IAM, EKS cluster, and related resources.

#Project Overview

This repository defines the infrastructure as code (IaC) for deploying an AWS EKS cluster and supporting resources using Terraform (in HCL). It sets up:

VPC + Subnets

IAM Policies / Roles

EKS Cluster provisioning

Security groups and network routing

Outputs needed for CI/CD / deployment pipelines

##Repository Structure
├── provider.tf         # AWS provider configuration
├── variable.tf         # Input variables
├── network.tf          # VPC, subnets, routing
├── EKS-Policy.tf       # IAM policies for EKS
├── EKS-cluster.tf      # EKS cluster definition
├── output.tf           # Outputs for other pipelines

### Prerequisites

Before using this Terraform project, ensure you have the following installed:

Terraform (v1.3+ recommended)

AWS CLI configured with credentials (aws configure)

IAM permissions to create AWS resources (VPC, EKS, IAM roles, etc.)

### Setup & Deployment
1. Clone the repository
git clone https://github.com/Deepthichintha/HRGF-INFRA-PIPELINE.git
cd HRGF-INFRA-PIPELINE

2. Initialize Terraform
terraform init

3. Review the planned changes
terraform plan \
  -var "aws_region=your-region" \
  -var "cluster_name=your-cluster"

4. Apply the configuration
terraform apply \
  -var "aws_region=your-region" \
  -var "cluster_name=your-cluster"


Replace your-region and your-cluster with actual values.

### Variables

You can set variables via terraform.tfvars or environment variables. Example:

aws_region     = "ap-south-1"
cluster_name   = "hrgf-eks"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]


(Add or update variables to reflect your infrastructure needs.)

### IAM Policies

Predefined policies for EKS and worker nodes are under EKS-Policy.tf — adjust permissions if your deployment scope changes (e.g., storage, autoscaling).

### Outputs

Outputs like the EKS cluster endpoint and other values can be used by pipelines (CI/CD) or deployment scripts:

terraform output cluster_endpoint
terraform output cluster_security_group_id

### Contributing

Contributions, fixes, and improvements are welcome!
Please open an issue or a pull request if you’d like to propose changes.
