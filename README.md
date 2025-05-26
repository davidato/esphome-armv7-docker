🚀 What Is This?

A multi-stage Docker build that:

    Installs all required build tools and dependencies for ESPHome (including Pillow-related libs)

    Builds ESPHome from PyPI inside a clean Python 3.11 environment

    Produces a slim runtime image with only the necessary libraries

    Runs ESPHome via Docker on port 6052

📦 Quick Start (Using Prebuilt Image)

You can use the prebuilt image from Docker Hub:

docker run --rm -it \
  -v /your/local/config:/config \
  -p 6052:6052 \
  davidedandrea/esphome

    Replace /your/local/config with the path to your ESPHome config directory.

🧱 Building the Image Yourself

Clone the repo and build the image manually:

git clone https://github.com/davidato/esphome-armv7-docker.git
cd esphome-armv7-docker
docker build -t custom-esphome-armv7 .

Then run it:

docker run --rm -it \
  -v /your/local/config:/config \
  -p 6052:6052 \
  custom-esphome-armv7

🔍 Notes

    Targeted for ARMv7 (e.g., Raspberry Pi 2, older boards)

    Based on Debian Slim Bullseye + Python 3.11

    Includes runtime dependencies required by Pillow, used by some ESPHome components

📄 License

This project is provided as-is under the MIT License.
