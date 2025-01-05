# Display the contents of the chaos/health-pause.yaml file
cat chaos/health-pause.yaml

# Run the chaos experiment defined in chaos/health.yaml
chaos run chaos/health.yaml

# List all pods in the go-demo-8 namespace
kubectl --namespace go-demo-8 get pods

# Output of the previous command showing the status of the pods
# NAME             READY STATUS  RESTARTS AGE
# go-demo-8-...    1/1   Running 0        9s
# go-demo-8-db-... 1/1   Running 0        11m

# Show the differences between chaos/health.yaml and chaos/health-pause.yaml
diff chaos/health.yaml chaos/health-pause.yaml
# >   pauses: 
# >     after: 10

# Run the chaos experiment defined in chaos/health-pause.yaml
chaos run chaos/health-pause.yaml

# List all pods in the go-demo-8 namespace again to see the updated status
kubectl --namespace go-demo-8 get pods
# NAME             READY STATUS  RESTARTS AGE
# go-demo-8-...    1/1   Running 0        2m19s
# go-demo-8-db-... 1/1   Running 0        22m