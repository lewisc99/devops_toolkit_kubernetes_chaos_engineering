# Display the contents of the file chaos/network-abort-100.yaml
cat chaos/network-abort-100.yaml

# Show the differences between chaos/network-rollback.yaml and chaos/network-abort-100.yaml
diff chaos/network-rollback.yaml chaos/network-abort-100.yaml

# Execute the chaos experiment defined in chaos/network-abort-100.yaml
chaos run chaos/network-abort-100.yaml