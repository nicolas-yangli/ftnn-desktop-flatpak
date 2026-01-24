#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION=$1
DEB_FILE="FTNN_desktop_${VERSION}_amd64.deb"
URL_PREFIX="https://softwaredownload.futunn.com/"
MANIFEST="com.futunn.ftnn-desktop.yml"

echo "Downloading ${URL_PREFIX}${DEB_FILE}"
curl -L -o "$DEB_FILE" "${URL_PREFIX}${DEB_FILE}"

echo "Calculating SHA256 sum"
SHA256=$(sha256sum "$DEB_FILE" | awk '{print $1}')

echo "Updating $MANIFEST"

# Replace the entire deb file name with the new version in the URL and build command.
# The `[^_]+` matches the old version string.
sed -i -E "s|FTNN_desktop_[^_]+_amd64.deb|FTNN_desktop_${VERSION}_amd64.deb|g" "$MANIFEST"
sed -i "s/sha256: .*/sha256: $SHA256/" "$MANIFEST"

echo "Cleaning up"
rm "$DEB_FILE"

echo "Done. Please review the changes in $MANIFEST."
