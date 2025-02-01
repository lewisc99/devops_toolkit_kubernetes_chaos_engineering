# Display the contents of the network delay chaos experiment configuration file
cat chaos/network-delay.yaml

# Show the differences between the network rollback and network delay chaos experiment configuration files
diff chaos/network-rollback.yaml chaos/network-delay.yaml

# Execute the network delay chaos experiment
chaos run chaos/network-delay.yaml

# Display the contents of the Istio network delay configuration file
cat k8s/network/istio-delay.yaml

# Show the differences between the Istio repeater and Istio delay configuration files
diff k8s/network/istio-repeater.yaml k8s/network/istio-delay.yaml

# Apply the Istio network delay configuration to the Kubernetes cluster in the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/network/istio-delay.yaml

# Execute the network delay chaos experiment again
chaos run chaos/network-delay.yaml