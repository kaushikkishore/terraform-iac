
resource "aws_eks_node_group" "terraform_node_group" {
  cluster_name    = aws_eks_cluster.terraform_cluster.name
  node_group_name = "terraform-node-group"
  node_role_arn   = aws_iam_role.terraform_eks_node_role.arn

  subnet_ids = flatten([
    aws_subnet.terraform_public_subnet[*].id
  ])

  capacity_type  = "ON_DEMAND"
  ami_type       = "AL2_x86_64"
  disk_size      = 20
  instance_types = ["t3.small"]

  scaling_config {
    min_size     = 1
    max_size     = 2
    desired_size = 1
  }
  update_config {
    max_unavailable = 1
  }
  labels = {
    role = "general"
  }
  tags = {
    "Name" = "${var.cluster_name}-node-group"
  }
  depends_on = [
    aws_iam_role_policy_attachment.terraform-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.terraform-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.terraform-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "terraform_eks_node_role" {
  name = "terraform-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "terraform-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.terraform_eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "terraform-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.terraform_eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "terraform-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.terraform_eks_node_role.name
}

