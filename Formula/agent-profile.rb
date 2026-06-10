class AgentProfile < Formula
  desc "Spawn-time role-profile resolver: one YAML role spec rendered into provider-native agent config"
  homepage "https://xiaoleiy.github.io/agent-profile/"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xiaoleiy/agent-profile/releases/download/v#{version}/agent-profile-aarch64-apple-darwin.tar.gz"
      sha256 "86bb24dd8c5aae05f5a4be8855e6df1211e451ba46ab175dda7606dcd2a22d42"
    else
      url "https://github.com/xiaoleiy/agent-profile/releases/download/v#{version}/agent-profile-x86_64-apple-darwin.tar.gz"
      sha256 "e4b1ea05fa140e6998ba9473c6464425a3c8b6d852dadaa25c4fd646c32a176c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xiaoleiy/agent-profile/releases/download/v#{version}/agent-profile-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5209c8684737af8c134ec22e1dd9f00ea9385904987677bdc6e40d30d5b9a23"
    else
      url "https://github.com/xiaoleiy/agent-profile/releases/download/v#{version}/agent-profile-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f008e1de18b4e128e4f10dbc4ed58084dedae8532bc5adc5bbaaf320223c36c1"
    end
  end

  def install
    bin.install "agent-profile"
    generate_completions_from_executable(bin/"agent-profile", "completions")
  end

  test do
    assert_match "agent-profile #{version}", shell_output("#{bin}/agent-profile --version")
  end
end
