#!/bin/bash

SCRIPT=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT"`
PROJECT_ROOT=$SCRIPT_DIR

export VERSION=`cat $PROJECT_ROOT/Cargo.toml | grep '^version' | head -n1 | cut -d'"' -f2 | tr -d '\n'`
echo Publish catgirl-engine v$VERSION

echo Replacing version number in catgirl-engine-utils with catgirl-engine version
sed -i "s/^version = \"[0-9.]*\"/version = \"$VERSION\"/" $PROJECT_ROOT/utils/Cargo.toml

echo Replacing version number in catgirl-engine-client with catgirl-engine version
sed -i "s/^version = \"[0-9.]*\"/version = \"$VERSION\"/" $PROJECT_ROOT/client/Cargo.toml
sed -i "s/^utils = { version = \"[0-9.]*\"/utils = { version = \"$VERSION\"/" $PROJECT_ROOT/client/Cargo.toml

echo Replacing version number in catgirl-engine-server with catgirl-engine version
sed -i "s/^version = \"[0-9.]*\"/version = \"$VERSION\"/" $PROJECT_ROOT/server/Cargo.toml
sed -i "s/^utils = { version = \"[0-9.]*\"/utils = { version = \"$VERSION\"/" $PROJECT_ROOT/server/Cargo.toml

echo Replacing version number in catgirl-engine dependencies with catgirl-engine version
sed -i "s/^utils = { version = \"[0-9.]*\"/utils = { version = \"$VERSION\"/" $PROJECT_ROOT/Cargo.toml
sed -i "s/^client = { version = \"[0-9.]*\"/client = { version = \"$VERSION\"/" $PROJECT_ROOT/Cargo.toml
sed -i "s/^server = { version = \"[0-9.]*\"/server = { version = \"$VERSION\"/" $PROJECT_ROOT/Cargo.toml
