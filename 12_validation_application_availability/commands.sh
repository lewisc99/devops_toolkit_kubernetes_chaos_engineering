# Display the contents of the chaos/health-http.yaml file
cat chaos/health-http.yaml

# Show the differences between chaos/health-pause.yaml and chaos/health-http.yaml
diff chaos/health-pause.yaml chaos/health-http.yaml

# Execute the chaos experiment defined in chaos/health-http.yaml
chaos run chaos/health-http.yaml

# Display the contents of the k8s/health/hpa.yaml file
cat k8s/health/hpa.yaml

# Apply the Horizontal Pod Autoscaler configuration in k8s/health/hpa.yaml to the go-demo-8 namespace
kubectl apply --namespace go-demo-8 --filename k8s/health/hpa.yaml

# Display the status of the Horizontal Pod Autoscaler for the go-demo-8 deployment
kubectl get hpa --namespace go-demo-8

# Execute the chaos experiment defined in chaos/health-http.yaml again
chaos run chaos/health-http.yaml