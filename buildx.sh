#!/bin/sh
git checkout stable
git gc
export RUST_BACKTRACE=1
cargo build --release --features final
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
docker image build -f scripts/docker/hub/Dockerfile --tag manifoldfinance/openethereum-instantseal .
