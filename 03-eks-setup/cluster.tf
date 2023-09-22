
resource "aws_eks_cluster" "terraform_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.terraform_eks_cluster_role.arn

  vpc_config {
    subnet_ids = flatten([
      aws_subnet.terraform_public_subnet[*].id
    ])
    # security_group_ids = [aws_security_group.terraform_eks_cluster_sg.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.terraform_eks_cluster_policy
  ]
  tags = {
    "Name" = "${var.cluster_name}"
  }
}

output "endpoint" {
  value = aws_eks_cluster.terraform_cluster.endpoint
}


data "aws_iam_policy_document" "terraform_assume_role" {
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
  assume_role_policy = data.aws_iam_policy_document.terraform_assume_role.json
}

resource "aws_iam_role_policy_attachment" "terraform_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.terraform_eks_cluster_role.name
}

