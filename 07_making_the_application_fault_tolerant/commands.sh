# Let’s take a look at a new definition.
cat k8s/terminate-pods/deployment.yaml

# Let’s apply that definition.
kubectl --namespace go-demo-8 apply --filename k8s/terminate-pods/deployment.yaml

# Next, we’re going to wait until the Pods of that Deployment rollout.
kubectl --namespace go-demo-8 rollout status deployment go-demo-8

# Finally, we’re going to execute the same chaos experiment we executed before.
chaos run chaos/terminate-pod-phase.yaml

kubectl get pods
# NAME                            READY   STATUS    RESTARTS      AGE
# go-demo-8                       1/1     Running   8 (14m ago)   26m
# go-demo-8-776487698c-w2t2z      1/1     Running   0             2m25s                                                                                Let's apply that definition.
# >> demo-8-db-84f9d8d965-nb9w5   1/1     Running   0             15m

