
data "aws_iam_policy_document" "terraform_test_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.terraform_aws_iam_openid_connect_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:default:aws-test"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.terraform_aws_iam_openid_connect_provider.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "terrafrom_test_oidc" {
  assume_role_policy = data.aws_iam_policy_document.terraform_test_oidc_assume_role_policy.json
  name               = "terraform_test_oidc"
}

resource "aws_iam_policy" "terraform_test_policy" {
  name = "terraform_test_policy"

  policy = jsonencode({
    Statement = [{
      Action = [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation"
      ]
      Effect   = "Allow"
      Resource = "arn:aws:s3:::*"
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "terraform_test_attach" {
  role       = aws_iam_role.terrafrom_test_oidc.name
  policy_arn = aws_iam_policy.terraform_test_policy.arn
}

output "test_policy_arn" {
  value = aws_iam_role.terrafrom_test_oidc.arn
}

