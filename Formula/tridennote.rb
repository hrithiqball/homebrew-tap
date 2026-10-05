class Tridennote < Formula
  desc "Notes, next level, in your terminal"
  homepage "https://github.com/hrithiqball/tridennote-tui"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.1/tridennote_darwin_arm64.tar.gz"
      sha256 "0167d36f7a20dfdfffe465cce46331fc1fca2a75ee027ab31d30142c9fe9b186"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.1/tridennote_darwin_amd64.tar.gz"
      sha256 "d5bfaf79d6812f4234399f53ffdb46157cd5a4b73bd37df68a6f95cf91edcc7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.1/tridennote_linux_arm64.tar.gz"
      sha256 "ffdd27458f1776d4d60556a197c0cf7db2250613728746a5006e8a5389497b8e"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.1/tridennote_linux_amd64.tar.gz"
      sha256 "993a14bc9eeaf89c55e7246ad6435b0a2e56b1bba957691fe2a806c412bdbc70"
    end
  end

  def install
    bin.install "tridennote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tridennote --version")
  end
end
