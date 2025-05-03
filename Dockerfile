FROM rust:1.86.0

RUN apt-get update && apt-get install -y \
    # tools for the build process
    avr-libc \
    gcc-avr \
    avrdude \
    libudev-dev \
    # tig is great for viewing git history
    tig \
    # less is needed e.g. for 'git diff' to make the output scrollable
    less

RUN rustup install nightly-2025-05-02 && \
    rustup default nightly-2025-05-02 && \
    rustup component add cargo rust-src rust-std

ARG USER
ARG UID
RUN useradd -m -s /bin/bash -u ${UID:-2222} $USER && \
    usermod -aG dialout $USER
USER ${USER}

RUN cargo +stable install ravedude

WORKDIR /home/$USER/dependencies_fetch_project/dummy
RUN cargo init
COPY ./Cargo.toml .
COPY ./rust-toolchain.toml .
RUN cargo fetch
# - For example when used as devcontainer, the UID is set to a default value (see above).
#   I wasn't able to pass the UID of the local user to the container in this case.
#   So when using the devcontainer, the local user is then used and can't access the fetched dependencies.
#   To solve this, the fetched dependencies are made readable and writable by anyone.
RUN chmod -R a+rw /usr/local/cargo/registry
