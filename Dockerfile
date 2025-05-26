# ---- Stage 1: Build environment ----
FROM python:3.11-slim-bullseye AS builder

# Install build tools and dependencies (incl. Pillow requirements)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential python3-dev cargo libssl-dev libffi-dev \
    libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev \
    libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev \
    && rm -rf /var/lib/apt/lists/*

# Install ESPHome da PyPI
RUN pip install --no-cache-dir esphome

# ---- Stage 2: Final image ----
FROM python:3.11-slim-bullseye AS final

# Install runtime libraries necessarie
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl1.1 libffi7 libjpeg62-turbo zlib1g libfreetype6 liblcms2-2 \
    libwebp6 libharfbuzz0b libfribidi0 libxcb1 \
    && rm -rf /var/lib/apt/lists/*

# Copia tutto il Python environment dalla fase di build
COPY --from=builder /usr/local /usr/local

# Configura container
ENV USERNAME="" PASSWORD=""
WORKDIR /config
EXPOSE 6052

ENTRYPOINT ["esphome"]
