class DroidCompanion < Formula
  desc "Named multi-turn companion sessions for Factory Droid"
  homepage "https://github.com/kumamaki/droid-companion"
  url "https://github.com/kumamaki/droid-companion/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "363e0da5676fd067b98f09e406eb495910ee1f6d54f910a344c4d54807b11295"
  version "0.1.1"
  license "MIT"
  head "https://github.com/kumamaki/droid-companion.git", branch: "main"

  depends_on "oven-sh/bun/bun" => :build
  # Runtime dependency (not a Homebrew formula): Factory `droid` CLI on PATH.

  def install
    system "bun", "build", "--compile", "src/companion.ts", "--outfile", "droid-companion"
    bin.install "droid-companion"
    (share/"droid-companion").install "contract/contract.md"
    (share/"droid-companion").install "skill/SKILL.md" if File.exist?("skill/SKILL.md")
  end

  def caveats
    <<~EOS
      Requires Factory Droid CLI (`droid`) on PATH with valid credentials.

        droid-companion doctor
        droid-companion install-skill

      Binary name: droid-companion
      Docs: https://github.com/kumamaki/droid-companion
    EOS
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/droid-companion --version")
  end
end
