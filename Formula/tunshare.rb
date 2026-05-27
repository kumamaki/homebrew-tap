class Tunshare < Formula
  desc "VPN sharing TUI for macOS"
  homepage "https://github.com/kumamaki/tunshare"
  license "MIT"
  version "0.3.0"

  depends_on :macos

  on_arm do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.3.0/tunshare-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "159a9852bdf12ffe3541a143c92f0b100787af321897cab10ed3f7eb6de5c895"
  end

  on_intel do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.3.0/tunshare-0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "e1371dc40f5cb5657eb591dab6c98b5bbf3daf27e259b0be2f0cb35c44860987"
  end

  def install
    bin.install "tunshare"
    doc.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  def caveats
    <<~CAVEATS
      tunshare requires root privileges to modify the packet filter:
        sudo tunshare

      Optional: install dnsmasq for DHCP on connected devices:
        brew install dnsmasq
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tunshare --version")
  end
end
