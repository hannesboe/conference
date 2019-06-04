FROM node:10

ENV NEO4J_URI=bolt+routing://neo4j-neo4j.persistence:7687

RUN mkdir -p /app
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

EXPOSE 4000

CMD ["npm", "start"]
