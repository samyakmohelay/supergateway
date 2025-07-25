FROM node:18-bullseye

# Install Docker CLI inside the container
RUN apt-get update && apt-get install -y docker.io

# Set environment variables for supergateway (can override via Render dashboard)
ENV MCP_MODE=stdio
ENV LOG_LEVEL=error
ENV DISABLE_CONSOLE_OUTPUT=true
ENV N8N_API_URL=https://n8n-figx.onrender.com
ENV N8N_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMmY0N2Q3ZC04YTdlLTRmMzgtYmQ2Zi0zZTg0ZTMwYjkxMjkiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzUyNDczMjIxLCJleHAiOjE3NTUwNTc2MDB9.PCLqD9eeAlrYWIaX5A5rBgoFwKD7F6YEOz4dk7XUdWI

# Run the supergateway command (use ENTRYPOINT or CMD)
CMD npx -y supergateway --stdio "docker run -i --rm -e MCP_MODE=stdio -e LOG_LEVEL=error -e DISABLE_CONSOLE_OUTPUT=true -e N8N_API_URL=$N8N_API_URL -e N8N_API_KEY=$N8N_API_KEY ghcr.io/czlonkowski/n8n-mcp:latest" --port 8000 --baseUrl http://localhost:8000 --ssePath /sse --messagePath /message
