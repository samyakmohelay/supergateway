# Use the official Supergateway base image
FROM supercorp/supergateway:latest

# Install any required tools (optional – supergateway comes ready)
WORKDIR /usr/src/app

# Expose port 8000 for HTTP/SSE endpoints
EXPOSE 8000

# Launch Supergateway, connecting via SSE to the n8n-MCP service
ENTRYPOINT ["npx", "supergateway"]
CMD ["--sse", "https://n8n-mcp-service-53ot.onrender.com/sse","--stdio","--port", "8000","--baseUrl", "https://supergateway.onrender.com","--ssePath", "/sse","--messagePath", "/message"]



















# # Stage 1: Fetch n8n-MCP server from its existing image
# FROM ghcr.io/czlonkowski/n8n-mcp:latest AS n8n-mcp

# # Stage 2: Build your Supergateway image with n8n-MCP included
# FROM supercorp/supergateway:latest

# # # Copy the n8n-MCP server binary and assets into /usr/local/bin
# # COPY --from=n8n-mcp /usr/local/bin/n8n-mcp /usr/local/bin/n8n-mcp
# # COPY --from=n8n-mcp /usr/local/lib/node_modules/n8n-mcp /usr/local/lib/node_modules/n8n-mcp

# # # Ensure the CLI is in PATH
# # ENV PATH="/usr/local/bin:${PATH}"

# # Copy the n8n-mcp dist folder and the bin symlink
# COPY --from=n8n-mcp /usr/local/lib/node_modules/n8n-mcp/dist /usr/local/lib/node_modules/n8n-mcp/dist
# COPY --from=n8n-mcp /usr/local/bin/n8n-mcp /usr/local/bin/n8n-mcp

# # Ensure node_modules are in place
# COPY --from=n8n-mcp /usr/local/lib/node_modules/n8n-mcp/node_modules /usr/local/lib/node_modules/n8n-mcp/node_modules

# # Make sure the MCP command is runnable
# RUN chmod +x /usr/local/bin/n8n-mcp

# # Create persistent data directory
# RUN mkdir /data

# # Launch Supergateway, pointing stdio at the bundled n8n-MCP binary
# ENTRYPOINT ["npx", "supergateway"]
# CMD ["--stdio", "n8n-mcp","--port", "8000","--baseUrl", "https://supergateway.onrender.com","--ssePath", "/sse","--messagePath", "/message","--env", "MCP_MODE=stdio","--env", "LOG_LEVEL=error","--env", "DISABLE_CONSOLE_OUTPUT=true","--env", "N8N_API_URL=https://n8n-figx.onrender.com","--env", "N8N_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMmY0N2Q3ZC04YTdlLTRmMzgtYmQ2Zi0zZTg0ZTMwYjkxMjkiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzUyNDczMjIxLCJleHAiOjE3NTUwNTc2MDB9.PCLqD9eeAlrYWIaX5A5rBgoFwKD7F6YEOz4dk7XUdWI"]

