#!/bin/bash
PROTOC_DIR=$(cd $(dirname $0); pwd)
docker run --rm -it \
  -v $PROTOC_DIR/Generated:$PROTOC_DIR/Generated \
  -v $PROTOC_DIR/proto:$PROTOC_DIR/proto \
  -w $PROTOC_DIR \
  grpc/swift \
  protoc \
    --swift_out=$PROTOC_DIR/Generated/ \
    --swiftgrpc_out=$PROTOC_DIR/Generated/ \
    --proto_path=$PROTOC_DIR \
    $PROTOC_DIR/proto/*.proto
