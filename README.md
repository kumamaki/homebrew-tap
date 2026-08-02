# homebrew-tap

Homebrew tap for kumamaki tools.

## Installation

```bash
brew tap kumamaki/tap
```

## Formulae

| Formula | Description |
|---------|-------------|
| [tunshare](https://github.com/kumamaki/tunshare) | macOS TUI app that shares your VPN connection over LAN via pf NAT |
| [tab-please](https://github.com/kumamaki/tab-please) | Generated + enriched zsh completions for popular CLIs |
| [droid-companion](https://github.com/kumamaki/droid-companion) | Named multi-turn companion sessions for Factory Droid (`droid-companion` binary) |

### tunshare

```bash
brew install tunshare
sudo tunshare
```

### tab-please

```bash
brew install tab-please
```

### droid-companion

```bash
brew install droid-companion
droid-companion doctor
```

Requires [Factory Droid](https://factory.ai) CLI on PATH. Build needs [Bun](https://bun.sh) (`oven-sh/bun/bun`).

Tracks tag **v0.1.1**. Binary name: **`droid-companion`**.
