# Get the ingress resources in the go-demo-8 namespace
kubectl --namespace go-demo-8 get ingress

# Enable the ingress addon in Minikube
minikube addons enable ingress

# Set the INGRESS_HOST environment variable to the Minikube IP address
$env:INGRESS_HOST = $(minikube ip)

# Print the value of the INGRESS_HOST environment variable
echo $env:INGRESS_HOST

# Display the contents of the ingress.yaml file
cat k8s/health/ingress.yaml

# Apply the ingress configuration from the ingress.yaml file in the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/health/ingress.yaml

# Send a request to the ingress host with the specified Host header
curl.exe -H "Host: go-demo-8.acme.com" "http://$env:INGRESS_HOST"