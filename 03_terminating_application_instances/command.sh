#you need to be on the path go-demo-8 created by cloning git clone https://github.com/vfarcic/go-demo-8.git

# Display the contents of the terminate-pod.yaml file to see the configuration
cat chaos/terminate-pod.yaml

# Execute the Chaos Engineering experiment defined in the terminate-pod.yaml file
chaos run chaos/terminate-pod.yaml

# Check the exit status of the last command to verify if the experiment was successful (0 means success)
echo $?

# List all pods in the go-demo-8 namespace to observe the state of the pods after the chaos experiment
kubectl --namespace go-demo-8 get pods
