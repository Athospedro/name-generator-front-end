FROM node:16

WORKDIR /home/consenso/Documentos/Progamação/progetoGeradorDeNomes/projeto-gerador-de-nomes01

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]