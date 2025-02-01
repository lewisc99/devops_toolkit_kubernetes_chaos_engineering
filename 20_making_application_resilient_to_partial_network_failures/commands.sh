# Display the contents of the Istio repeater configuration file
cat k8s/network/istio-repeater.yaml

# Open the Envoy documentation for the router filter retry options in the default web browser (Linux)
open https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/router_filter#x-envoy-retry-on

# Open the Envoy documentation for the router filter retry options in the default web browser (Windows)
# Note: Manually copy and paste the URL into the browser if needed
https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/router_filter#x-envoy-retry-on

# Apply the Istio repeater configuration to the Kubernetes cluster in the go-demo-8 namespace
kubectl --namespace go-demo-8 apply --filename k8s/network/istio-repeater.yaml

# Run the chaos engineering experiment defined in the network-rollback.yaml file
chaos run chaos/network-rollback.yaml