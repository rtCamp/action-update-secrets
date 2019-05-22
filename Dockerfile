# alpine:latest at 2019-01-04T21:27:39IST
FROM alpine@sha256:46e71df1e5191ab8b8034c5189e325258ec44ea739bba1e5645cff83c9048ff1

LABEL "com.github.actions.icon"="lock"
LABEL "com.github.actions.color"="ffd33d"
LABEL "com.github.actions.name"="Update secrets"
LABEL "com.github.actions.description"="This task will update secrets from GH secrets to code"

RUN apk update \
    && apk upgrade \
    && apk add \
        bash \
    && rm -rf /var/cache/apk/*
COPY *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]
