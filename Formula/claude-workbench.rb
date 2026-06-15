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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.97.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "61ab8a281eb19dc06e0d628ab88fa14f5fb4289ead39d6495c8e66253b1e3e90"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.97.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "782157edf78396c03b33bba4454278840e772b9d8b01109809d49fc2c05523cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.97.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44bdfda3a4c2c8fb8e018a94e7abc322f2946d58e05e316e735daf7b28b27573"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.97.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db8d45f92f4c8ffff0a2447466b35d8d06db02b4cfa7806abcff7c0c0e7496c8"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
