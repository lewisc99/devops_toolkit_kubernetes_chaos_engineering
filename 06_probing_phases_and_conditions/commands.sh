# Before we go through that, let’s describe the Pod that we created and see the types, phases, and conditions it’s in.
kubectl --namespace go-demo-8 describe pod go-demo-8


# We’ll take a look at a new YAML definition.
cat chaos/terminate-pod-phase.yaml

# What matters more is the diff.
diff chaos/terminate-pod-pause.yaml chaos/terminate-pod-phase.yaml

# Let’s see what we get when we execute this experiment.
chaos run chaos/terminate-pod-phase.yaml

# Just as before, we will validate that the status of the experiment is indeed indicating an error. 
# We’ll do that by retrieving the exit code of the last command.
echo $?

# Now, let’s take a look at the Pod’s logs. Why is it failing, and why didn’t we notice that there is something wrong with it from the start?
kubectl --namespace go-demo-8 logs go-demo-8

# Now that we know that the Pod was never really running because a database is missing, we’re going to fix it by deploying MongoDB.
kubectl --namespace go-demo-8 apply --filename k8s/db

# Next, we’ll wait until the database is rolled out.
kubectl --namespace go-demo-8 rollout status deployment go-demo-8-db

# Now that the database is rolled out, we’re going to take a look at the Pods.
kubectl --namespace go-demo-8 get pods
# NAME             READY STATUS  RESTARTS AGE
# go-demo-8        1/1   Running 21       66m
# go-demo-8-db-... 1/1   Running 0        7m17s


# To begin, all three probes executed before the actions are passing, meaning the Pod existed when the experiment started. 
# It was running and ready. Then, the action to terminate the Pod was executed, and after the pause of 10 seconds, the probe failed.
chaos run chaos/terminate-pod-phase.yaml

echo $?