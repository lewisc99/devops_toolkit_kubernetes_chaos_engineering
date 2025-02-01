# Run a siege pod in the go-demo-8 namespace to simulate a denial of service attack
# with 50 concurrent users for 20 seconds targeting the http://go-demo-8 endpoint
kubectl --namespace go-demo-8 \
  run siege \
  --image yokogawa/siege \
  --generator run-pod/v1 \
  -it --rm \
  -- --concurrent 50 --time 20S "http://go-demo-8"

# Run a siege pod in the go-demo-8 namespace to simulate a denial of service attack
# with 50 concurrent users for 20 seconds targeting the http://go-demo-8 endpoint
kubectl run siege `
  --namespace go-demo-8 `
  --image=yokogawa/siege `
  -it --rm `
  -- /bin/sh -c "siege --concurrent 50 --time 20S http://go-demo-8"

# Run a siege pod in the go-demo-8 namespace to simulate a denial of service attack
# with 50 concurrent users for 20 seconds targeting the http://go-demo-8/limiter endpoint
kubectl --namespace go-demo-8 \
  run siege \
  --image yokogawa/siege \
  --generator run-pod/v1 \
  -it --rm \
  -- --concurrent 50 --time 20S "http://go-demo-8/limiter"

# Run a siege pod in the go-demo-8 namespace to simulate a denial of service attack
# with 50 concurrent users for 20 seconds targeting the http://go-demo-8/limiter endpoint
kubectl run siege `
  --namespace go-demo-8 `
  --image=yokogawa/siege `
  -it --rm `
  -- /bin/sh -c "siege --concurrent 50 --time 20S http://go-demo-8/limiter"