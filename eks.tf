resource "aws_eks_cluster" "eks_cluster" {
  depends_on = [
    aws_iam_role.eks_role,
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicyAttachment,
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicyAttachment
  ]
  name     = var.eks_name
  role_arn = aws_iam_role.eks_role.arn
  version  = "1.27"

  # Assign EKS Deployment to subnet
  vpc_config {
    subnet_ids              = module.vpc.private_subnets
    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  kubernetes_network_config {
    service_ipv4_cidr = "172.20.0.0/16"
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Run local command to update the config to connect to the cluster in terminal
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${var.eks_name}"
  }
}
