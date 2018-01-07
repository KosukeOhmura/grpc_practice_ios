#!/bin/bash
PROTOC_DIR=$(cd $(dirname $0); pwd)
docker run --rm -it \
  -v $PROTOC_DIR/generated:$PROTOC_DIR/generated \
  -v $PROTOC_DIR/proto:$PROTOC_DIR/proto \
  -w $PROTOC_DIR \
  grpc/swift \
  protoc \
    --swift_out=$PROTOC_DIR/generated/ \
    --swiftgrpc_out=$PROTOC_DIR/generated/ \
    --proto_path=$PROTOC_DIR \
    $PROTOC_DIR/proto/*.proto
