# Display the contents of the health-db.yaml file
cat chaos/health-db.yaml

# Show the differences between health-http.yaml and health-db.yaml files
diff chaos/health-http.yaml chaos/health-db.yaml

# Run the chaos experiment defined in the health-db.yaml file
chaos run chaos/health-db.yaml