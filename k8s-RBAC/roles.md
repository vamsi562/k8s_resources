# Role & role binding
- By default use who created cluster have admin access

## How to provide access to user?
- user details
- role of user needed
- role binding

Steps:
- Create a IAM user in AWS
- Create a policy  - Eg: ***suppose just describing cluster***
  - select EKS and select describe permission also to which cluster
  - Provide name to that policy RoboshopDevEKSCluster
- attach that policy to user
- Authorisation in k8s done by role and role binding
  - Create a role yaml 
  - create a role binding yaml
- Edit AWS authentication config Map
    ```
        kubectl get configmap aws-auth -n kube-system -o yaml
    ```
- .kube/config - file
   - once above user login with aws access key and secret key in his device
    run below command
    ```
      aws eks update-kubeconfig --region us-east-1 --name roboshop-dev
    ```
aws-auth - check for authentication
role & role binding - provide authorisation access to cluster

Similarly we will have for cluster role and role binding

## Service Accounts
We need to integrate OIDC provider

```
    eksctl utils associate-iam-oidc-provider --cluster roboshop-dev --approve
```
Create a policy in aws
attach that policy arn in below command
```
    eksctl create iamservice account --cluster roboshop-dev --name secret-reader --namespace roboshop --attach-policy-arn arn:aws:iam::055610219795:policy/RoboshopMySQLSecretReader  --approve
```
We can create with above command or with yaml as well