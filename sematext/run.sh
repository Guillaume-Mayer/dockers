docker run -d --name sematext-agent --restart=always \
  -e LOGSENE_TOKEN=b01c4bf1-86ea-4957-8353-df7c534ae2c3 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/localtime:/etc/localtime:ro \
  sematext/sematext-agent-docker