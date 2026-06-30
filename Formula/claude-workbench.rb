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
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "f62485b4a6d7c92ff5932a1dea3e921db52c99683352911f8bfcc55b3bf622dd"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "18c0f02f0a4e319679b0aa83a0308bc9e49fdffdfdaa4e4a60a2a14c99dd4bb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dac31caa6a4715f277a92a2eb810c1fe79a0f4249bc5d0a7cda4609814658949"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fd3c744e557a3456e6ad81291b7ec94e36707097d6f847cfae4e6f59052eec9"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
