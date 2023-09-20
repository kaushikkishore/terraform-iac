# Missing pod selector. 

/*
resource "aws_eks_fargate_profile" "terraform_eks_fargate" {
  cluster_name           = aws_eks_cluster.terraform_cluster.name
  fargate_profile_name   = "terraform_eks_fargate"
  pod_execution_role_arn = aws_iam_role.terraform_eks_fargate_profile.arn
  subnet_ids             = aws_subnet.terraform_subnet[*].id

  selector {
    namespace = "terraform-eks-fargate"
  }
  depends_on = [aws_iam_role_policy_attachment.terraform-AmazonEKSFargatePodExecutionRolePolicy]
}

resource "aws_iam_role" "terraform_eks_fargate_profile" {
  name = "terraform-eks-fargate-profile"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "terraform-AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.terraform_eks_fargate_profile.name
}

*/
