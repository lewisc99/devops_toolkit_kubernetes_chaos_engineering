# Start Minikube with VirtualBox driver and disable VT-x/AMD-v check
minikube start --driver=virtualbox --no-vtx-check

# Change directory to go-demo-8 and pull the latest changes from the repository
cd go-demo-8
git pull

# Create a new namespace called go-demo-8 in Kubernetes
kubectl create namespace go-demo-8

# Display the contents of all files in the k8s/terminate-pods/app directory
cat k8s/terminate-pods/app/*

# Apply the Kubernetes configuration files in the k8s/terminate-pods/app directory to the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/terminate-pods/app

# This command retrieves the list of pods in the 'go-demo-8' namespace using kubectl.
# 'kubectl' is the command-line tool for interacting with Kubernetes clusters.
# '--namespace go-demo-8' specifies the namespace to query.
# 'get pods' lists all the pods in the specified namespace.
kubectl --namespace go-demo-8 get pods

# Wait for the rollout status of the go-demo-8 deployment to be complete
kubectl --namespace go-demo-8 rollout status deployment go-demo-8