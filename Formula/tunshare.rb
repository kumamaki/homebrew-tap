class Tunshare < Formula
  desc "VPN sharing TUI for macOS"
  homepage "https://github.com/kumamaki/tunshare"
  license "MIT"
  version "0.4.0"

  depends_on :macos

  on_arm do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.4.0/tunshare-0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "c6803b71e32fc472e4763c889f1456d67961c9e5c252a260536bfabb062b14fa"
  end

  on_intel do
    url "https://github.com/kumamaki/tunshare/releases/download/v0.4.0/tunshare-0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "762f914b01f81d958393a0cf36be65d5a7789afcc301efa2b15230920095f16e"
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
