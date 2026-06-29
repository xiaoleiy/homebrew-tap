class Podget < Formula
  include Language::Python::Virtualenv

  desc "Download specific podcast episode audio from Apple Podcasts, RSS, or xiaoyuzhou"
  homepage "https://github.com/xiaoleiy/podget"
  url "https://github.com/xiaoleiy/podget/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8f4c0e756db977cee21f6d83923a07ff07216e60166ef7ada2d282b44d477232"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "podget #{version}", shell_output("#{bin}/podget --version")
  end
end
