cat > docker/master/run.sh << 'EOF'
#!/bin/bash
# Run Jenkins Master container
docker network create jenkins-net 2>/dev/null || true

docker run -d \
  --name jenkins-master \
  --network jenkins-net \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

echo "Waiting for Jenkins to start..."
sleep 30

echo "=== Admin Password ==="
docker exec jenkins-master \
  cat /var/jenkins_home/secrets/initialAdminPassword
EOF
chmod +x docker/master/run.sh
