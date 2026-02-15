FROM node:24.13.1-bookworm

# set working directory
WORKDIR /app

# install opencode globally
RUN npm i -g opencode-ai&& \
  echo "Installed opencode version: $(opencode --version)"

# non-root user (recommended)
RUN adduser --disabled-password opencode

# create necessary directories and set permissions
RUN mkdir -p /home/opencode/.local/share/opencode/ && \
  mkdir -p /home/opencode/.local/state/opencode && \
  mkdir -p /home/opencode/.config/opencode/ && \
  chown -R opencode:opencode /home/opencode

# switch to non-root user
USER opencode

# docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/pilinux/opencode:0.0.1 --output type=docker .
