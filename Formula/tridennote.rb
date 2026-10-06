class Tridennote < Formula
  desc "Notes, next level, in your terminal"
  homepage "https://github.com/hrithiqball/tridennote-tui"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.3.0/tridennote_darwin_arm64.tar.gz"
      sha256 "d1e6b9dbda2c01393671658979a556db17386a99c4cc8632bac4a51022cf6587"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.3.0/tridennote_darwin_amd64.tar.gz"
      sha256 "8fd4cf64ecd7ee33b038eec7d345015dd9b3a9f6c86643b7286c50d545181a28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.3.0/tridennote_linux_arm64.tar.gz"
      sha256 "15824694887bbec1a2ef7488ee73577b235365636300738b9ff682705a267115"
    else
      url "https://github.com/hrithiqball/tridennote-tui/releases/download/v1.3.0/tridennote_linux_amd64.tar.gz"
      sha256 "8afc4324a6c1317df94a30fbcc1447aeb456174f670f718bbb68c72f0e2d7e1a"
    end
  end

  def install
    bin.install "tridennote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tridennote --version")
  end
end
