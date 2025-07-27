FROM node:18-bullseye

WORKDIR /app

# Install Supergateway globally
RUN npm install -g supergateway

# Expose the port that Supergateway will run on
EXPOSE 8000

# Set environment variables, or preferably set them via the Render dashboard for security
ENV N8N_API_URL=https://n8n-figx.onrender.com
ENV N8N_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMmY0N2Q3ZC04YTdlLTRmMzgtYmQ2Zi0zZTg0ZTMwYjkxMjkiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzUyNDczMjIxLCJleHAiOjE3NTUwNTc2MDB9.PCLqD9eeAlrYWIaX5A5rBgoFwKD7F6YEOz4dk7XUdWI

# Start Supergateway and point it at your running n8n instance
# CMD npx supergateway \
#   --streamableHttp \
#   --port 8000 \
#   --baseUrl http://localhost:8000 \
#   --ssePath /sse \
#   --messagePath /message \
#   --n8nApiUrl $N8N_API_URL \
#   --n8nApiKey $N8N_API_KEY

# Single command, all parts in **one line**
CMD npx supergateway --sse --port 8000 --baseUrl http://localhost:8000 --ssePath /sse --messagePath /message --n8nApiUrl $N8N_API_URL --n8nApiKey $N8N_API_KEY

