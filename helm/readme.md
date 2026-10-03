# HELM CHARTS
- package management
- templatisation of manifest files

## Installation
```
        curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
        chmod 700 get_helm.sh
        ./get_helm.sh
```

```
        helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
        helm repo update
        helm upgrade --install aws-ebs-csi-driver \
        --namespace kube-system \
        --set controller.serviceAccount.create=false \
        --set controller.serviceAccount.name=ebs-csi-controller-sa \
        aws-ebs-csi-driver/aws-ebs-csi-driver
        # Check if driver installed or not
        kubectl get pod -n kube-system -l "app.kubernetes.io/name=aws-ebs-csi-driver,app.kubernetes.io/instance=aws-ebs-csi-driver"
```