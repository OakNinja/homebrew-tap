# Project Overview

This is the Homebrew tap repository for OakNinja's projects. Currently, it hosts the formula for:

- **mm**: A command-line tool to interactively select and run make targets.

# Maintenance

## Updating `mm` Formula

To update the `mm` formula to a new version:

1.  **Create Release in MakeMe:** ensure a new release (tag) is created in the [MakeMe repository](https://github.com/OakNinja/MakeMe).
2.  **Get URL and SHA256:**
    - Get the URL of the new release source archive (`.tar.gz`).
    - Calculate the SHA256 checksum of the archive: `curl -L -s <url> | shasum -a 256`.
3.  **Update Formula:**
    - Edit `Formula/mm.rb`.
    - Update `url` and `sha256` fields.
4.  **Verify:**
    - Run `brew audit --new Formula/mm.rb` (or `oakninja/tap/mm` if tapped).
    - detailed check: `brew install --build-from-source ./Formula/mm.rb`.
5.  **Commit and Push:** Push changes to `main`.
