# Change directory to go-demo-8
cd go-demo-8

# Pull the latest changes from the git repository
git pull

# Create a new namespace called go-demo-8 in Kubernetes
kubectl create namespace go-demo-8

# Label the namespace go-demo-8 to enable Istio injection
kubectl label namespace go-demo-8 istio-injection=enabled

# Display the contents of all files in the k8s/health/app directory
cat k8s/health/app/*

# Apply the Kubernetes configuration files in the k8s/health/app directory to the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/health/app/

# Wait for the deployment of go-demo-8 to complete in the go-demo-8 namespace
kubectl --namespace go-demo-8 rollout status deployment go-demo-8

# List all pods in the go-demo-8 namespace
kubectl --namespace go-demo-8 get pods

# NAME                            READY   STATUS    RESTARTS   AGE
# go-demo-8-79988fcfcb-5hp8p      2/2     Running   0          11m
# go-demo-8-79988fcfcb-mtqkj      2/2     Running   0          18m
# go-demo-8-db-84f9d8d965-x9ntn   2/2     Running   0          18m

# Display the contents of the k8s/network/istio.yaml file
cat k8s/network/istio.yaml

# Apply the Istio configuration file in the k8s/network/istio.yaml to the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/network/istio.yaml

# Display the contents of all files in the k8s/network/repeater directory
cat k8s/network/repeater/*

# Apply the Kubernetes configuration files in the k8s/network/repeater directory to the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/network/repeater

# Wait for the deployment of repeater to complete in the go-demo-8 namespace
kubectl --namespace go-demo-8 rollout status deployment repeater

# List all pods in the go-demo-8 namespace
kubectl --namespace go-demo-8 get pods
# NAME                            READY   STATUS    RESTARTS   AGE
# go-demo-8-79988fcfcb-5hp8p      2/2     Running   0          11m
# go-demo-8-79988fcfcb-mtqkj      2/2     Running   0          18m
# go-demo-8-db-84f9d8d965-x9ntn   2/2     Running   0          18m
# repeater-6cc58675bb-fkrhc       2/2     Running   0          3m18s

# Send a curl request to the repeater service with the Host header set to repeater.acme.com (Linux)
curl -H "Host: repeater.acme.com" "http://$INGRESS_HOST?addr=http://go-demo-8"

# Send a curl request to the repeater service with the Host header set to repeater.acme.com (Windows)
curl.exe -H "Host: repeater.acme.com" "http://$($env:INGRESS_HOST)?addr=http://go-demo-8"

# Version: 0.0.1; Release: unknown