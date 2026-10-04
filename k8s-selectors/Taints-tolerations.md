```
kubectl taint nodes <node-name> <key>=<value>:<effect>
```
**EFFECT**
***NOSchedule***: Strong constraint. New pods without a matching toleration will not be scheduled on this node. Existing running pods are unaffected.

***PreferNoSchedule***: Soft constraint. The scheduler will try to avoid placing non-tolerating pods here, but will still do so if there are no other available resources in the cluster

***NoExecute***: Eviction constraint. Any currently running pods on the node that do not tolerate this taint will be immediately evicted. New pods without tolerations will be blocked

# Important:
- Though iftolerations added, we cannot gaurantee that tainted node will be selected for creating pod.
- Once tolerations added, it will consider that node as well like other nodes for pod creation
- if we want pod to be created in that pod, we need to use node selector with taints and tolerations