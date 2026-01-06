output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.eks.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs (2 AZs)"
  value       = aws_subnet.public[*].id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.eks.name
}
