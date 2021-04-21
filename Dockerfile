FROM python:3.6

RUN apt-get update \
    && apt-get install -y nodejs npm

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY package*.json ./
RUN npm install \
    && npm i -g nodemon

COPY . .
CMD [ "nodemon", "./main.py" ]
