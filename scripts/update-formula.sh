#!/usr/bin/env bash
set -euo pipefail

REPO="hrithiqball/tridennote-tui"
FORMULA="Formula/tridennote.rb"

TAG="${1:-$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')}"
VERSION="${TAG#v}"
BASE="https://github.com/${REPO}/releases/download/${TAG}"
CHECKSUMS="$(curl -fsSL "${BASE}/checksums.txt")"

sha() {
  local value
  value="$(printf '%s\n' "${CHECKSUMS}" | awk -v file="$1" '$2 == file { print $1 }')"
  if [ -z "${value}" ]; then
    echo "No checksum for $1 in ${TAG}" >&2
    exit 1
  fi
  printf '%s' "${value}"
}

cat > "${FORMULA}" <<RUBY
class Tridennote < Formula
  desc "Notes, next level, in your terminal"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "${BASE}/tridennote_darwin_arm64.tar.gz"
      sha256 "$(sha tridennote_darwin_arm64.tar.gz)"
    else
      url "${BASE}/tridennote_darwin_amd64.tar.gz"
      sha256 "$(sha tridennote_darwin_amd64.tar.gz)"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "${BASE}/tridennote_linux_arm64.tar.gz"
      sha256 "$(sha tridennote_linux_arm64.tar.gz)"
    else
      url "${BASE}/tridennote_linux_amd64.tar.gz"
      sha256 "$(sha tridennote_linux_amd64.tar.gz)"
    end
  end

  def install
    bin.install "tridennote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tridennote --version")
  end
end
RUBY

echo "Wrote ${FORMULA} for ${TAG}"
