# Apply the Istio manifest without confirmation
istioctl manifest apply --skip-confirmation

# Get the Istio ingress gateway service in the istio-system namespace
kubectl --namespace istio-system get service istio-ingressgateway

# For Minikube with Linux
# Export the ingress port of the Istio ingress gateway service
export INGRESS_PORT=$(kubectl --namespace istio-system get service istio-ingressgateway --output jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
# Export the ingress host by combining the Minikube IP and the ingress port
export INGRESS_HOST=$(minikube ip):$INGRESS_PORT

# Print the ingress host
echo $INGRESS_HOST

# For Minikube with Windows
# Get the ingress port of the Istio ingress gateway service
kubectl --namespace istio-system get service istio-ingressgateway --output jsonpath="{.spec.ports[?(@.name=='http2')].nodePort}"

# Set the Minikube IP environment variable
$env:MINIKUBE_IP = $(minikube ip)

# Print the Minikube IP
echo $env:MINIKUBE_IP

# Set the ingress port environment variable
$INGRESS_PORT = $(kubectl --namespace istio-system get service istio-ingressgateway --output jsonpath="{.spec.ports[?(@.name=='http2')].nodePort}")
# Print the ingress port
echo $INGRESS_PORT

# Set the ingress host by combining the Minikube IP and the ingress port
$INGRESS_HOST = "$($MINIKUBE_IP):$($INGRESS_PORT)"
# Print the ingress host
echo $INGRESS_HOST