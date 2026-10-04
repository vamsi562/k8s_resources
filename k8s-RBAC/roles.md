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
      aws eks update-config --region us-east-1 --name roboshop-dev
    ```
aws-auth - check for authentication
role & role binding - provide authorisation access to cluster



