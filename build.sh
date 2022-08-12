mkdocs build
./fixlinks.sh

rm -rf .build
mkdir -p .build/mkdocs-plugins
mv site/* .build/mkdocs-plugins
echo "Ready to publish"
