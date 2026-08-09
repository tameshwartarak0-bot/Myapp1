---
name: Flutter setup
description: Stable Flutter installation and verification in this workspace
---

The `https://flutter.dev/get-flutter` installer endpoint may return 404; cloning Flutter's official `stable` branch is a reliable fallback. The SDK may need to be restored in a fresh shell, and Dart projects should be formatted with `dart format`.

**Why:** The installer endpoint was unavailable during setup, while the official stable repository worked.

**How to apply:** When Flutter is missing, clone the stable branch to a local SDK directory, add its `bin` directory to PATH for the command session, run `flutter pub get`, then use `dart format`, `flutter analyze`, and `flutter test`.