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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.81.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "025da54e3dcaaf5c36228fa7caa13dec58b4f586635879306d08c96bd808e7df"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.81.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "98e866126f49004fd2e3c0fdb1e3051ca57ba4ec19ef3cac9adff30f325cb9b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.81.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e60b4626978be32214d3b6e4f66eb20c75ee169a40e4f72caab27ffc0cd4b3b8"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.81.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0ca7798ab43480eaabb85e34d4879a04ccd7c9b03545b2a7a50bb400a61bdc8"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
