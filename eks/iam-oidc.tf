
data "tls_certificate" "terraform_tls_certificate" {
  url = aws_eks_cluster.terraform_eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "terraform_aws_iam_openid_connect_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.terraform_tls_certificate.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.terraform_eks_cluster.identity[0].oidc[0].issuer
}

output "data_url" {
  value = aws_eks_cluster.terraform_eks_cluster.identity[0].oidc[0].issuer
}

output "data_url_tls" {
  value = data.tls_certificate.terraform_tls_certificate.url
}

/*
data "aws_iam_openid_connect_provider" "terraform_openid_connect" {
  url = "https://oidc.eks.ap-south-1.amazonaws.com/id/9BDD3ABC7EBBD8B04B1F92FF85CF5D0A"
}

output "client_id_list" {
  value = data.aws_iam_openid_connect_provider.terraform_openid_connect.client_id_list
}

output "thumbprint_list" {
  value = data.aws_iam_openid_connect_provider.terraform_openid_connect.thumbprint_list
}
*/
