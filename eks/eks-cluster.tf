data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "terraform_eks_cluster_role" {
  name               = "terraform_eks_cluster_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "tf_eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.terraform_eks_cluster_role.name
}

# -----------------------------------------------------------
# EKS Cluster
# -----------------------------------------------------------

resource "aws_eks_cluster" "terraform_eks_cluster" {
  name     = "terraform_eks_cluster"
  role_arn = aws_iam_role.terraform_eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.terraform_public_subnet_01.id,
      aws_subnet.terraform_public_subnet_02.id,
      aws_subnet.terraform_private_subnet_01.id,
      aws_subnet.terraform_private_subnet_02.id
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.tf_eks_cluster_AmazonEKSClusterPolicy]
}
