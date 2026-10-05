class Tridennote < Formula
  desc "Notes, next level, in your terminal"
  homepage "https://github.com/hrithiqball/tridennote-tui"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.0/tridennote_darwin_arm64.tar.gz"
      sha256 "6a5071555b155d01c81f8cc2711fd565dc4d404c1048dafceed5dbd04b80202d"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.0/tridennote_darwin_amd64.tar.gz"
      sha256 "e2dca9fdc90eb9a9510ce7903bc2647c854b2e2621f22c376c162cbed715f295"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.0/tridennote_linux_arm64.tar.gz"
      sha256 "e093b03abcbddc48bdddaa4d4147cfeed89d93629c55d94e106300336485e2fb"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.1.0/tridennote_linux_amd64.tar.gz"
      sha256 "6d3a07f33c2818662fec306353371bdaf4b301cd3a97e41792255876fc6d94f8"
    end
  end

  def install
    bin.install "tridennote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tridennote --version")
  end
end
