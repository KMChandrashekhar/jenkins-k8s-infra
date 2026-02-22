cat > docker/agent/run.sh << 'EOF'
#!/bin/bash
# Usage: ./run.sh <SECRET_TOKEN>
SECRET=$1

if [ -z "$SECRET" ]; then
  echo "Usage: ./run.sh <SECRET_TOKEN>"
  exit 1
fi

docker run -d \
  --name jenkins-agent \
  --network jenkins-net \
  --user root \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e JENKINS_URL=http://jenkins-master:8080 \
  -e JENKINS_AGENT_NAME=docker-agent-1 \
  -e JENKINS_SECRET=${SECRET} \
  -e JENKINS_AGENT_WORKDIR=/home/jenkins/agent \
  jenkins-agent:latest

echo "✅ Agent started"
docker logs jenkins-agent | tail -5
EOF
chmod +x docker/agent/run.sh
