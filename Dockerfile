#FROM registry.redhat.io/rhel8/nodejs-16
#FROM default-route-openshift-image-registry.apps.ocp4.example.com/demo/nodejs-16

FROM image-registry.openshift-image-registry.svc:5000/test-application/nodejs-22:1787591075

ENV APP_ROOT=/opt/app-root

WORKDIR $APP_ROOT

COPY app.js .
COPY LICENSE .
COPY package.json .
COPY build.txt .
COPY views ./views
COPY public ./public

RUN npm install 

EXPOSE 8080

CMD ["node", "app.js"]
