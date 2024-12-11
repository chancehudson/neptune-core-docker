FROM rust:bullseye AS builder

RUN apt update
RUN apt install -y build-essential libleveldb-dev libsnappy-dev cmake

RUN git clone https://github.com/Neptune-Crypto/neptune-core.git /tmp/neptune
WORKDIR /tmp/neptune
RUN git checkout release
RUN cargo build --release

FROM rust:bullseye

COPY --from=builder /tmp/neptune/target/release /neptune

CMD ["/neptune/neptune-core"]
