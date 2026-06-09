# CLI/TUI-only install of Agent Hub — no GUI app, no sudo, no Gatekeeper.
# Installs just the `agent-hub` binary (extracted from the release bundle) into
# the Homebrew prefix, which is user-writable on Apple Silicon. Ideal for
# terminal users and IT-managed Macs without admin rights.
#
# Usage:  brew install xiaoleiy/tap/agent-hub-cli
#
# version + sha256 below are rewritten automatically by the release workflow.
class AgentHubCli < Formula
  desc "CLI + TUI to monitor AI coding agents (Claude Code, Cursor, Codex)"
  homepage "https://github.com/xiaoleiy/agent-hub"
  version "0.3.0"
  license "MIT"

  # Prebuilt binary extracted from the macOS release bundle — the same binary
  # serves the GUI, CLI, and TUI (it routes on its arguments).
  if Hardware::CPU.arm?
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_aarch64.app.tar.gz"
    sha256 "93a0b2089d5285e053eedb73ce185b32c53ac30278c6cb42eb7a2c52cc14a31a"
  else
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_x64.app.tar.gz"
    sha256 "96be5e52e2e849a8d1ef5b6d0f8b9bb99a93b8278641467ef343650775f0ac17"
  end

  def install
    # Homebrew may strip the single top-level "Agent Hub.app" dir on extract,
    # so locate the binary wherever it landed.
    binary = Dir.glob("**/Contents/MacOS/agent-hub").first
    odie "agent-hub binary not found in release archive" if binary.nil?
    bin.install binary => "agent-hub"
  end

  def caveats
    <<~EOS
      Installed as the `agent-hub` command (the formula name is agent-hub-cli):
        agent-hub tui      # interactive dashboard
        agent-hub status   # system + agent status
        agent-hub --help   # all commands
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-hub --version")
  end
end
