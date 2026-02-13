class Tunshare < Formula
  desc "macOS TUI app that shares your VPN connection over LAN via pf NAT"
  homepage "https://github.com/Mehdi-Hp/tunshare"
  url "https://github.com/Mehdi-Hp/tunshare/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3f29041c547c4b4ec6655a1fe93dea5637db3850c5d11de8e23954f190a945a1"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      tunshare requires root privileges to configure the macOS firewall.
      Run with: sudo tunshare

      For automatic DHCP configuration, install dnsmasq:
        brew install dnsmasq
    EOS
  end

  test do
    output = shell_output("#{bin}/tunshare 2>&1", 1)
    assert_match "must be run as root", output
  end
end
