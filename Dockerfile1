FROM node:18-bullseye

WORKDIR /app

# Install Supergateway and MCP server globally
RUN npm install -g supergateway @n8n/mcp-server

# Set environment variables
ENV MCP_MODE=stdio
ENV LOG_LEVEL=error
ENV DISABLE_CONSOLE_OUTPUT=true
ENV N8N_API_URL=https://n8n-figx.onrender.com
ENV N8N_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

EXPOSE 8000

# Run supergateway and call mcp-server directly (NO docker run)
CMD npx -y supergateway \
  --stdio "npx -y @n8n/mcp-server" \
  --port 8000 \
  --baseUrl http://localhost:8000 \
  --ssePath /sse \
  --messagePath /message
