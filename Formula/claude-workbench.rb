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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.85.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "a5cb35e5672ed60b37c290a1c3767b3c9e66cbde9d0d26a741f09d808bf5e778"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.85.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "8397764cb50d236457f33fb8edcbdd94f121ad41320caa2fa354e894f366ab31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.85.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffdbf359bdab3be82d34b29a59a6bc998484f7c6d3531c244961bd4d94cb3eae"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.85.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f897ab2fed74b5c388c595e17b313f3b9f1c289587f37334e2683c53d6aacbe5"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
