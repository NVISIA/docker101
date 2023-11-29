FROM nginx:mainline-alpine3.18-slim
COPY cool-website-source /usr/share/nginx/html
CMD ["nginx","-g","daemon off;"]