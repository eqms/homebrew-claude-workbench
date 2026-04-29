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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.86.1/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "fe318100644846ce1eb99ad8b47b9d334a73271707ad73cd78ee4f6f414f09a6"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.86.1/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "4147d0cd2e2faac7d3b13fc0a29a4db8feebcc36fc6b3de234d7ddbae8ef69fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.86.1/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f18c66eeed514ea90b734f8b6e0bb2915d2adde9b1ca6c21f65c48448121845"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.86.1/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "771c90127b8a0b1ece78ceefd9d535ee044589b66b9348d89153783e5125e6d4"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
