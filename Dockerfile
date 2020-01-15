FROM node:alpine as builder
WORKDIR /webapp
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /webapp/build /usr/share/nginx/html

# novo comentario
# Cria uma imagem a partir da imagem-base node:alpine, roda o comando npm install e joga o conteúdo da pasta 'build' no diretório do nginx