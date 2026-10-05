class Tridennote < Formula
  desc "Notes, next level, in your terminal"
  homepage "https://github.com/hrithiqball/tridennote-tui"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.2.0/tridennote_darwin_arm64.tar.gz"
      sha256 "d3b447f5a36f81a38b9ada2b4c9da2d814c25a590187bb721c73efaa7e86b49c"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.2.0/tridennote_darwin_amd64.tar.gz"
      sha256 "e22c0c669080029b0e8f9e8bd01b1e93a8f4116c8640810093727928477cb1f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.2.0/tridennote_linux_arm64.tar.gz"
      sha256 "bf45afaa41a4c495ba4540cc634218e7416da4085f3b258c86b1a24bba61c93b"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.2.0/tridennote_linux_amd64.tar.gz"
      sha256 "4fb24d40ee3c0a00d5829b87db132db8ea14e6bfa04cd50a551f4622724ae24a"
    end
  end

  def install
    bin.install "tridennote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tridennote --version")
  end
end
