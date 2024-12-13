# Clone the specified GitHub repository
git clone https://github.com/vfarcic/go-demo-8.git

# Change directory to the cloned repository
cd go-demo-8

# Update the local repository with the latest changes from the remote repository
git pull

# Start a local Minikube cluster
minikube start

# Set the kubectl context to Minikube
kubectl config set-context minikube

# Switch to using the Minikube context in kubectl
kubectl config use-context minikube

# List all Minikube profiles
minikube profile list

# Create a new namespace called go-demo-8 in the Kubernetes cluster
kubectl create namespace go-demo-8

# Set the current context's namespace to go-demo-8
kubectl config set-context --current --namespace=go-demo-8

# View the current kubectl configuration, showing only the namespace
kubectl config view --minify -o jsonpath='{..namespace}'

# Display the contents of the pod configuration file
cat k8s/terminate-pods/pod.yaml

# Apply the pod configuration in the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/terminate-pods/pod.yaml

# List all pods in the current namespace (go-demo-8)
kubectl get pods
