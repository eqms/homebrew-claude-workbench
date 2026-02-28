# Homebrew formula for claude-workbench - Rust-based TUI multiplexer
# https://github.com/eqms/claude-workbench
#
# After a new release, update:
#   1. version variable
#   2. SHA256 checksums (compute with: shasum -a 256 <file>)

class ClaudeWorkbench < Formula
  desc "Rust-based TUI multiplexer for AI-assisted development"
  homepage "https://github.com/eqms/claude-workbench"
  version "0.61.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v#{version}/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "aca3983af85baf4aaa008cb2e11f0e7d2de45e3d05c6aa5df10127b10f90fa2d"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v#{version}/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "64061f33f9858b26f6fbf0fe5258a2bb7ae4622a8e3deee822aad4a1460f145c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v#{version}/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c7f8f96e0cfadea3dacf6406e0022de353cb4a0fc7f7770ef89c4ed2bcdc8da"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v#{version}/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7d098def13c853f718d938bcb19fe34bffc15b7341d85f3cf7fb1e8e598d7bc"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
