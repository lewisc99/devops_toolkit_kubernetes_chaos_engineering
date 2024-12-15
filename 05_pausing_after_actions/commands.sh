# Display the contents of the terminate-pod-pause.yaml file to see the configuration
cat chaos/terminate-pod-pause.yaml

# Compare the contents of terminate-pod-ssh.yaml and terminate-pod-pause.yaml to see the differences
diff chaos/terminate-pod-ssh.yaml chaos/terminate-pod-pause.yaml

# Execute the Chaos Engineering experiment defined in the terminate-pod-pause.yaml file
chaos run chaos/terminate-pod-pause.yaml

# Check the exit status of the last command to verify if the experiment was successful (0 means success)
echo $?

# Apply the pod configuration in the go-demo-8 namespace to restore or create the pod defined in pod.yaml
# Now, before we move forward and explore a few other essential things,
# we’re going to recreate that failed Pod before we add a few more missing pieces that would make this experiment really valid.
kubectl --namespace go-demo-8 apply --filename k8s/terminate-pods/pod.yaml
