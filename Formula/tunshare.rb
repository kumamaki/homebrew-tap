class Tunshare < Formula
  desc "VPN sharing TUI for macOS"
  homepage "https://github.com/kumamaki/tunshare"
  license "MIT"
  version "0.2.0-dev1"

  depends_on :macos

  on_arm do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.2.0-dev1/tunshare-0.2.0-dev1-aarch64-apple-darwin.tar.gz"
    sha256 "79645440191d1fed410815c197c60e21f8aedc2e4bf2e3d14e173af98b9b5a42"
  end

  on_intel do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.2.0-dev1/tunshare-0.2.0-dev1-x86_64-apple-darwin.tar.gz"
    sha256 "de203abec16cfd01854b18e88ba2a07eecd79d6ec8beb337602106a31dc62558"
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
