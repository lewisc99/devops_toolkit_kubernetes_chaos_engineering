#linux
# Loop 10 times and send a curl request to the specified host and address
for i in {1..10}; do 
  curl -H "Host: repeater.acme.com" "http://$INGRESS_HOST?addr=http://go-demo-8"
  echo ""
done

#windows
# Loop 10 times and send a curl request to the specified host and address
for ($i = 1; $i -le 10; $i++) {
  curl.exe -H "Host: repeater.acme.com" "http://$env:INGRESS_HOST?addr=http://go-demo-8"
  echo ""
}

# Describe the virtual service go-demo-8 in the go-demo-8 namespace
kubectl --namespace go-demo-8 describe virtualservice go-demo-8

# Apply the Istio configuration from the specified file
kubectl --namespace go-demo-8 apply --filename k8s/network/istio.yaml

# Describe the virtual service go-demo-8 again to see the changes
kubectl --namespace go-demo-8 describe virtualservice go-demo-8 

# Display the contents of the chaos/network-rollback.yaml file
cat chaos/network-rollback.yaml

# Show the differences between chaos/network.yaml and chaos/network-rollback.yaml
diff chaos/network.yaml chaos/network-rollback.yaml

# Run the chaos experiment defined in chaos/network-rollback.yaml
chaos run chaos/network-rollback.yaml

#linux
# Loop 10 times and send a curl request to the specified host and address
for i in {1..10}; do 
  curl -H "Host: repeater.acme.com" "http://$INGRESS_HOST?addr=http://go-demo-8"
  echo ""
done

#windows
# Loop 10 times and send a curl request to the specified host and address
for ($i = 1; $i -le 10; $i++) {
  curl.exe -H "Host: repeater.acme.com" "http://$env:INGRESS_HOST?addr=http://go-demo-8"
  echo ""
}

# Describe the virtual service go-demo-8 in the go-demo-8 namespace again
kubectl --namespace go-demo-8 describe virtualservice go-demo-8