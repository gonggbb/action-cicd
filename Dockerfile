# 使用 Node.js 基础镜像
FROM node:20

# 创建工作目录
WORKDIR /app

# 复制项目文件到容器
COPY . .

# 安装依赖
RUN npm ci

# 构建 VitePress 站点
RUN npm run docs:build

# 启动 nginx 或配置其他静态服务器
# 可以使用 serve 或其他方法来提供静态文件
RUN npm install -g serve
CMD ["serve", "-s", "docs/.vitepress/dist"]

# 开放端口（可以根据需要更改）
EXPOSE 3000
