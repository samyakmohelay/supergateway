FROM supercorp/supergateway:latest

# Use ENTRYPOINT to ensure arguments are passed correctly
ENTRYPOINT ["npx", "supergateway"]
# CMD ["--sse", "--port", "8000", "--baseUrl", "http://localhost:8000", "--ssePath", "/sse", "--messagePath", "/message"]
# Pass flags to supergateway via exec-form CMD
# CMD ["--sse","--port","8000","--baseUrl","https://localhost:8000","--ssePath","/sse","--messagePath","/message"]

# CMD ["--mcpUrl", "https://n8n-figx.onrender.com","--port", "8000","--baseUrl", "https://supergateway.onrender.com","--ssePath","/sse","--messagePath", "/message"]

# CMD ["--stdio", "npx -y @modelcontextprotocol/server-filesystem /Users/MyName/Desktop","--port", "8000","--baseUrl", "https://your-supergateway-service.onrender.com","--ssePath", "/sse","--messagePath", "/message"]
CMD ["--stdio", "npx -y @modelcontextprotocol/server-filesystem /data","--port", "8000","--baseUrl", "https://your-supergateway-service.onrender.com","--ssePath", "/sse","--messagePath", "/message"]





# FROM node:18-bullseye

# WORKDIR /app

# # Install Supergateway globally
# RUN npm install -g supergateway@latest

# # Expose the port that Supergateway will run on
# EXPOSE 8000

# # Set environment variables, or preferably set them via the Render dashboard for security
# # ENV N8N_API_URL=https://n8n-figx.onrender.com
# # ENV N8N_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMmY0N2Q3ZC04YTdlLTRmMzgtYmQ2Zi0zZTg0ZTMwYjkxMjkiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzUyNDczMjIxLCJleHAiOjE3NTUwNTc2MDB9.PCLqD9eeAlrYWIaX5A5rBgoFwKD7F6YEOz4dk7XUdWI

# # Start Supergateway and point it at your running n8n instance
# # CMD npx supergateway \
# #   --streamableHttp \
# #   --port 8000 \
# #   --baseUrl http://localhost:8000 \
# #   --ssePath /sse \
# #   --messagePath /message \
# #   --n8nApiUrl $N8N_API_URL \
# #   --n8nApiKey $N8N_API_KEY

# # Single command, all parts in **one line**
# # CMD npx supergateway --sse --port 8000 --baseUrl http://localhost:8000 --ssePath /sse --messagePath /message --n8nApiUrl $N8N_API_URL --n8nApiKey $N8N_API_KEY


# # Add debugging - this will show exactly what command is being run
# RUN echo "#!/bin/bash" > /app/debug-start.sh && \
#     echo "echo 'Starting with command: npx supergateway --sse --port 8000 --baseUrl http://localhost:8000 --ssePath /sse --messagePath /message --n8nApiUrl \$N8N_API_URL --n8nApiKey \$N8N_API_KEY'" >> /app/debug-start.sh && \
#     echo "npx supergateway --sse --port 8000 --baseUrl http://localhost:8000 --ssePath /sse --messagePath /message --n8nApiUrl \$N8N_API_URL --n8nApiKey \$N8N_API_KEY" >> /app/debug-start.sh && \
#     chmod +x /app/debug-start.sh

# CMD ["/bin/bash", "/app/debug-start.sh"]
