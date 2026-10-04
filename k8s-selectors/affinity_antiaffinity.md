# Node Affinity:
```
kubectl get nodes --show-labels
```

```
kubectl label nodes <your-node-name> <key>=<value>
```

## requiredDuringSchedulingIgnoredDuringExecution:
- it is the hard rule and pod cannot be Scheduled without it
- It is a strict constraint
- 
```
affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: alpha.eksctl.io/cluster-name
                operator: In
                values:
                  - roboshop-dev
              - key: app
                operator: In
                values:
                  - affinity
```
As above yaml reference, we have defined two key value pairs under matching expressions. K8s will consider it as ***and*** statement - as it should satisfy both the statements

```
affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: alpha.eksctl.io/cluster-name
                operator: In
                values:
                  - roboshop-dev
          - matchExpressions:
              - key: app
                operator: In
                values:
                  - affinity
```
As in above, two match expression statements defined. K8s will consider them as ***or*** statement. So if any one satisfied it will assign the pod to it

## preferredDuringSchedulingIgnoredDuringExecution
- It is soft rule
- it check for assigning nodes based on weights assigned
- if found in one node it will assign pod to it, else it may assign to other available worker node
- 
```
preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 10
          preference:
            matchExpressions:
              - key: app
                operator: In
                values:
                  - affinity
        - weight: 100
          preference:
            matchExpressions:
              - key: app
                operator: In
                values:
                  - preferred
```
- As above defined, in preferred nodes get allocated based on the weights proivded. HIgher the weight higer the preferrence

We can also use the combination of required and preferred together
- ***required rule acts as a strict initial filter to narrow down the acceptable nodes. Then, the preferred rule acts as a tie-breaker score to choose the best option out of that filtered list.***
```
affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: alpha.eksctl.io/cluster-name
                operator: In
                values:
                  - roboshop-dev
              # - key: app
              #   operator: In
              #   values:
              #     - affinity
      preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 10
          preference:
            matchExpressions:
              - key: app
                operator: In
                values:
                  - affinity
        - weight: 100
          preference:
            matchExpressions:
              - key: app
                operator: In
                values:
                  - preferred
```
