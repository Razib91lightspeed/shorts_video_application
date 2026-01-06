#!/usr/bin/env bash
set -euo pipefail

echo "== Shortz bootstrap =="

if [ ! -f "pubspec.yaml" ]; then
  echo "ERROR: Run this script from the project root (where pubspec.yaml is)."
  exit 1
fi

if [ ! -d "android" ] || [ ! -d "ios" ]; then
  echo "Platform folders missing. Running: flutter create ."
  flutter create .
else
  echo "Platform folders exist. Skipping flutter create."
fi

echo "Running: flutter pub get"
flutter pub get

echo "Done."
