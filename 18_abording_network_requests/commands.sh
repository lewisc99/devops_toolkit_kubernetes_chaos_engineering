# Display the contents of the chaos/network.yaml file
cat chaos/network.yaml

$env:INGRESS_HOST = $(minikube ip)

# Execute the chaos engineering experiment defined in the chaos/network.yaml file
chaos run chaos/network.yaml