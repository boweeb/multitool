# syntax = docker/dockerfile:1.2

FROM us.gcr.io/k8s-artifacts-prod/kustomize/kustomize:v3.10.0 AS kustomize
FROM registry.access.redhat.com/ubi8/ubi-minimal as final
COPY --from=kustomize --chmod=0755 /app/kustomize /usr/local/bin/kustomize

# RUN useradd --create-home appuser
# WORKDIR /home/appuser
# USER appuser

WORKDIR /
USER nobody

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "echo 'Hello World'"]
