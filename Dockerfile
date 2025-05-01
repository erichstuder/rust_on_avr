FROM rust:1.86.0

RUN apt-get update && apt-get install -y \
    gcc-avr

# RUN rustup install nightly-2025-05-01 && \
#     rustup target add avr-none --toolchain nightly-2025-05-01 && \
#     rustup default nightly-2025-05-01

RUN rustup install nightly && \
    rustup default nightly
