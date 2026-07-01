# Homebrew formula for claude-workbench - Rust-based TUI multiplexer
# https://github.com/eqms/claude-workbench
#
# After a new release, update:
#   1. URLs with new version number (4 places)
#   2. SHA256 checksums (compute with: shasum -a 256 <file>)

class ClaudeWorkbench < Formula
  desc "Rust-based TUI multiplexer for AI-assisted development"
  homepage "https://github.com/eqms/claude-workbench"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.1/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "eec7db7266f16f7c7d2189433a3ba56ca57714372db5f0d1e2270edb948c5fe3"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.1/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "f8d8369bcdd2c3f156536e2614d64cdbc65d788a884c10f56a3f22362818086e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.1/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35ad9edab35f9cd7b11472c491310e17cd0955b938713aed0626923f0810a3a0"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.1/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5a53e619733f1b3358612ef3a54011ddb5d6658f5de54ec2984d8b92374d569"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
