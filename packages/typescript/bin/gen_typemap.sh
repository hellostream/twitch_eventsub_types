#!/usr/bin/env bash

set -eux

cp "$1" /usr/app/schema.json
OUT_FILE=$(realpath "$2")
cd /usr/app

echo '/// <reference types="typescript" />' > "$OUT_FILE"

node bin/transform_schema.js

node_modules/.bin/quicktype \
  -o "$OUT_FILE" \
  --lang typescript \
  --src-lang schema \
  --no-runtime-typecheck \
  --just-types \
  --prefer-unions \
  --acronym-style camel \
  './schema_fixed.json#/definitions/'

echo >> "$OUT_FILE"
echo "export type EventTypeMap = {" >> "$OUT_FILE"
jq -r \
  '.definitions | keys | .[]' \
  schema_fixed.json \
  | sed -e 's/\./\-/g;p;s/[-_]/\./g;s/\b\(.\)/\u\1/g;s/\.//g' \
  | paste -s -d' \n' \
  | sed 's/\([-a-z_]*\)\(.*\)/"\1":\2,/' >> "$OUT_FILE"
echo "};" >> "$OUT_FILE"

node_modules/.bin/prettier "$OUT_FILE" -w

cat "$OUT_FILE"
