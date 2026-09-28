# steps to create statuc EFS
- create a EFS file system in aws, we need to create it under cluster vpc
- attach policy **AmazonEFSCSIDriverPolicy** to ec2iam role
- install efs drivers 
  ```
    kubectl kustomize \
    "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-3.X" > public-ecr-driver.yaml

    kubectl apply -f public-ecr-driver.yaml

    (or)
   ```
    kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable"
   ```
  ```
- Create a pv, pvc to that EFS
- Attach pvc as volume mounts to container

# Dynamic provisioning

**Here it will not create a new EFS. We need to provision EFS manualy even for dynamic as well. K8s creates a access point in dynamic**

- Create a Storage class & pvc - refer storage class in pvc
- attach PVC as volume mounts to container
