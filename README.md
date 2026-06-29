# Homebrew Tap — xiaoleiy

Personal Homebrew tap. `brew tap xiaoleiy/tap`, then install any formula below.

| Formula | What |
|---|---|
| `agent-hub` (cask) | Menu-bar/CLI/TUI to monitor AI coding agents (Claude Code, Cursor, Codex) on macOS |
| `podpull` | Download specific podcast episode audio (Apple Podcasts / RSS / xiaoyuzhou) |

## Agent Hub

[Agent Hub](https://github.com/xiaoleiy/agent-hub): a menu-bar, CLI, and TUI tool
to monitor and manage AI coding agents (Claude Code, Cursor, Codex) on macOS.

### Install

```bash
brew tap xiaoleiy/tap
brew install --cask xiaoleiy/tap/agent-hub
```

This installs the **Agent Hub** GUI app and the `agent-hub` CLI/TUI.

### Update / uninstall

```bash
brew upgrade --cask agent-hub
brew uninstall --cask agent-hub
```

> `Casks/agent-hub.rb` is updated automatically by the Agent Hub release
> workflow on each published release.

## podpull

[podpull](https://github.com/xiaoleiy/podpull): a CLI to download a specific
podcast episode's audio from an Apple Podcasts show, a raw RSS feed, or a
xiaoyuzhou (小宇宙) episode link — with an interactive multi-select picker.

```bash
brew install xiaoleiy/tap/podpull
podpull search "睡前故事"
podpull get 1532755821 --latest 1
```
