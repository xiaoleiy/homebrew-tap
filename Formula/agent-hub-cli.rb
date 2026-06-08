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
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_aarch64.app.tar.gz"
    sha256 "8462fc9e12643df71290a68af44aae551cdb6baece688370826d01d751e8dd58"
  end

  on_intel do
    url "https://github.com/xiaoleiy/agent-hub/releases/download/v#{version}/Agent.Hub_x64.app.tar.gz"
    sha256 "8420fbdb61ccde37a24dfafe3a483deed00751169b59ac0705257b65608b7abc"
  end

  def install
    # The release artifact is the .app bundle; we only want the binary, which
    # also serves the CLI/TUI (the GUI/CLI/TUI is one binary routed by args).
    bin.install "Agent Hub.app/Contents/MacOS/agent-hub" => "agent-hub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-hub --version")
  end
end
