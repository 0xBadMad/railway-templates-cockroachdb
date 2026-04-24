# syntax=docker/dockerfile:1
FROM cockroachdb/cockroach:v24.2.1

ENV COCKROACH_DATABASE=defaultdb     COCKROACH_USER=root     COCKROACH_PASSWORD=

EXPOSE 26257 8080

VOLUME ["/cockroach/cockroach-data"]

CMD ["/cockroach/cockroach", "start-single-node", "--insecure", "--advertise-addr=0.0.0.0", "--http-addr=0.0.0.0:8080", "--listen-addr=0.0.0.0:26257", "--store=/cockroach/cockroach-data", "--background=false"]
