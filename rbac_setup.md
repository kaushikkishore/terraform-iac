To grant access to an Amazon EKS (Elastic Kubernetes Service) cluster for another person, you can use AWS Identity and Access Management (IAM) roles and Kubernetes RBAC (Role-Based Access Control). Here's a step-by-step guide on how to do this:

1. **AWS IAM Role Setup:**

   a. Log in to the AWS Management Console with your account that has cluster admin permissions.

   b. Open the IAM Console.

   c. Create an IAM role for the person you want to grant access to. This role will be assumed by the user or their AWS identity (e.g., an IAM user or an IAM role associated with their AWS service).

   d. Attach necessary permissions policies to this IAM role. To interact with the EKS cluster, the role should have the `AmazonEKSClusterPolicy` attached. You may also need to attach additional policies depending on what actions the person should be able to perform.

2. **Kubernetes RBAC Setup:**

   a. Open a terminal with `kubectl` installed and configured to work with your EKS cluster. If you haven't configured `kubectl` yet, you can do so using the AWS CLI and the `aws eks update-kubeconfig` command.

   b. Create a Kubernetes RBAC role or cluster role and bind it to the AWS IAM role created in step 1.

   For example, create a Kubernetes RBAC role named `eks-access-role` in a YAML file (`eks-access-role.yaml`):

   ```yaml
   kind: Role
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     namespace: <namespace> # Replace with the target namespace
     name: eks-access-role
   rules:
     - apiGroups: [""]
       resources: ["pods", "services", "configmaps"] # Customize based on the permissions needed
       verbs: ["get", "list", "watch"]
   ```

   c. Bind the role to the AWS IAM role using a Kubernetes RoleBinding or ClusterRoleBinding. Create a YAML file (`eks-access-binding.yaml`) for the binding:

   ```yaml
   kind: RoleBinding # or ClusterRoleBinding for cluster-wide access
   apiVersion: rbac.authorization.k8s.io/v1
   metadata:
     name: eks-access-binding
     namespace: <namespace> # Replace with the target namespace
   subjects:
     - kind: User
       name: arn:aws:iam::123456789012:role/eks-access-role # Replace with the ARN of the IAM role
       apiGroup: rbac.authorization.k8s.io
   roleRef:
     kind: Role # or ClusterRole for cluster-wide access
     name: eks-access-role
     apiGroup: rbac.authorization.k8s.io
   ```

3. **Apply the YAML Files:**

   Apply both the role and binding YAML files to your cluster using `kubectl`:

   ```bash
   kubectl apply -f eks-access-role.yaml
   kubectl apply -f eks-access-binding.yaml
   ```

4. **Share AWS IAM Role ARN:**

   Finally, share the ARN of the AWS IAM role you created (e.g., `arn:aws:iam::123456789012:role/eks-access-role`) with the person you want to grant access to. They can assume this role using AWS CLI, AWS SDK, or other AWS services to interact with the EKS cluster.

Remember to restrict permissions appropriately by fine-tuning the IAM policies and Kubernetes RBAC rules to ensure the person only has the necessary access for their tasks. Also, ensure secure handling of AWS credentials and IAM roles.

## Another documentation

[How to Add IAM User and IAM Role to AWS EKS Cluster](https://antonputra.com/kubernetes/add-iam-user-and-iam-role-to-eks/)
