class DroidCompanion < Formula
  desc "Named multi-turn companion sessions for Factory Droid"
  homepage "https://github.com/kumamaki/droid-companion"
  url "https://github.com/kumamaki/droid-companion/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f8ba2ffba943d067eb31db696136ade2edf755cc86baade4a446133116ffd604"
  version "0.1.2"
  license "MIT"
  head "https://github.com/kumamaki/droid-companion.git", branch: "main"

  # Build with Bun on PATH (official install, mise, etc.). Do NOT depend on
  # oven-sh/bun — Homebrew Tap Trust blocks third-party taps as deps.
  # Runtime: Factory `droid` CLI on PATH (not a Homebrew formula).

  def install
    bun = which("bun")
    odie <<~EOS unless bun
      bun is required to build droid-companion but was not found on PATH.

        curl -fsSL https://bun.sh/install | bash
        # or: brew install oven-sh/bun/bun   # requires: brew trust oven-sh/bun
    EOS

    system bun, "build", "--compile", "src/companion.ts", "--outfile", "droid-companion"
    bin.install "droid-companion"
    (share/"droid-companion").install "contract/contract.md"
    (share/"droid-companion").install "skill/SKILL.md" if File.exist?("skill/SKILL.md")
  end

  def caveats
    <<~EOS
      Requires Factory Droid CLI (`droid`) on PATH with valid credentials.

        droid-companion setup
        droid-companion doctor

      Binary name: droid-companion
      Docs: https://github.com/kumamaki/droid-companion
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/droid-companion --version")
  end
end
