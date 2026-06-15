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
  version "0.3.2"
  license "MIT"

  # Prebuilt binary extracted from the macOS release bundle — the same binary
  # serves the GUI, CLI, and TUI (it routes on its arguments).
  if Hardware::CPU.arm?
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_aarch64.app.tar.gz"
    sha256 "80e2e9fb8dc8a8f42c0cf1c6d33b3b83a18c7fe1a50f5a7b63aa428291b3a42a"
  else
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_x64.app.tar.gz"
    sha256 "01b7843dffcc4278feed4b3e80f5c7bed13d91dbcebc39c6e7e5b23e028feac0"
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
