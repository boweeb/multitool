# syntax = docker/dockerfile:1.2

FROM us.gcr.io/k8s-artifacts-prod/kustomize/kustomize:v3.10.0 AS kustomize
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest as final
COPY --from=kustomize /app/kustomize /usr/local/bin/kustomize

WORKDIR /
USER nobody

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["echo", "Hello World"]
