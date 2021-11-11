FROM "python:alpine3.14"

RUN apk add --no-cache libpq  && \ 
    apk add --virtual .build-deps --no-cache \ 
    build-base \
    python3-dev \
    linux-headers \
    gcc \
    musl-dev \
    postgresql-dev && \
    pip install psycopg2-binary pg_activity && \
    apk del .build-deps

ENTRYPOINT [ "pg_activity" ]