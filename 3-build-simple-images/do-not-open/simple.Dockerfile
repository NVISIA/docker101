FROM nginx:mainline-alpine3.18-slim
CMD ["nginx","-g", "daemon off;"]
