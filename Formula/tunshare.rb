class Tunshare < Formula
  desc "VPN sharing TUI for macOS"
  homepage "https://github.com/kumamaki/tunshare"
  license "MIT"
  version "0.2.0"

  depends_on :macos

  on_arm do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.2.0/tunshare-0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "1ad11b752a6962e9d1fa3f1d8dc30cf06c590ef5f2c5f832df73bea8e2e1570a"
  end

  on_intel do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.2.0/tunshare-0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "5ed8aca6e601cc3b31130dc77754d422a7adc37cdb7caa7a2bc37cbe45be0f81"
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
