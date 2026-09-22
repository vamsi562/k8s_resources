# Commands
``` 
 kubectl api-resources
```
## Namespace
``` 
 kubectl get namespaces
```
``` 
 kubectl create namespace <namespace-name>
```
``` 
 kubectl delete namespace <namespace-name>
```
```
kubectl apply -f 01-Namespace.yaml
```
```
kubectl delete -f 01-Namespace.yaml
```
```
kubectl config set-context --current --namespace=<namespace-name>
```
## pods
```
kubectl get pods 
```
```
kubectl get pods -o wide
```
```
kubectl delete pod <podname>
```
```
kubectl get pod <podname> -n <namespace> -o jsonpath='{.spec.containers[*].name}'
```
```
kubectl exec -it <podname> -c <container> -n <namespace> -- bash
```
```
kubectl describe pod <podname>
```
```
kubectl replace --force -f <yaml> 
not recommended
```
