# steps to create statuc EFS
- create a EFS file system in aws, we need to create it under cluster vpc
- attach policy **AmazonEFSCSIDriverPolicy** to ec2iam role
- install efs drivers 
  ```
    kubectl kustomize \
    "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-3.X" > public-ecr-driver.yaml
  ```
