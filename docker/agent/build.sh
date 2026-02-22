cat > docker/agent/build.sh << 'EOF'
#!/bin/bash
# Build Jenkins Agent image
docker build -t jenkins-agent:latest .
echo "✅ Agent image built"
EOF
chmod +x docker/agent/build.sh
