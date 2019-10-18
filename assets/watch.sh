STATIC_DIR="../priv/static"
if [ -d "$STATIC_DIR" ]; then rm -Rf "$STATIC_DIR"; fi
mkdir "$STATIC_DIR"
cp -R static/* "$STATIC_DIR"
parcel build src/index.js --out-dir "$STATIC_DIR/dist" --public-url dist 