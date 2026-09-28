# Steps to use ebs static driver

- Create disk manually in aws under volumes & note down volume id *storage creates it*
- Disk must be in same az as of node
- Install ebs drivers before mounting 
   ```
      kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.66"
   ````
- attach ebs policy **AmazonEBSCSIDriverPolicy** to ec2 instance iam role
- Create **PV**(*persistent volume*) yaml -  *k8s admin creates it*
  ```
  AccessModes:
   - ReadWriteOnce -> can be mounted to single pod. Also it can be added to multiple pods when all those pods running under same node
   - ReadOnlyMany -> can be assigned read only by many nodes
   - ReadWriteMany -> can be assigned read write  by many nodes
   - ReadWriteOncePod -> volume can be mounted as read-write by only a single Pod
  ```
  ```
  ReclaimPolicy:
   - Delete -> If pod deleted , Delete volume from k8s and external as well
   - Recycle -> If pod deleted, delete data inside volume and keep disk
   - Retain -> Dont delete data
  ```
- PVC claim:
   - provide  pv name in yaml
   - also keep storage class as empty

# commands
 ```
  kubectl get pv
  kubectl get pvc
  kubectl get node --show-labels
```

# Steps to ebs dynamic driver
- we need to create a storage class which inturn creates a disk and PV
- create a pvc
- attach pvc to pod

**for static we need to specify node selector where as for dynamic, volume gets created in node where pod created**