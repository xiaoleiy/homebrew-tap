# Homebrew Tap — Agent Hub

Homebrew tap for [Agent Hub](https://github.com/xiaoleiy/agent-hub): a menu-bar,
CLI, and TUI tool to monitor and manage AI coding agents (Claude Code, Cursor, Codex) on macOS.

## Install

```bash
brew tap xiaoleiy/tap
brew install --cask xiaoleiy/tap/agent-hub
```

This installs the **Agent Hub** GUI app and the `agent-hub` CLI/TUI.

## Update / uninstall

```bash
brew upgrade --cask agent-hub
brew uninstall --cask agent-hub
```

> `Casks/agent-hub.rb` is updated automatically by the Agent Hub release
> workflow on each published release.
