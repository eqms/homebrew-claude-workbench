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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.99.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "69a58b03aaf3fa2784ea54b8d5b8250529376058a1617d108f31a699ef528ecc"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.99.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "0fd9893ac5841c7b378f75bcea0c0a5c2b38ef2ef9a10a6d4bce80887c77e078"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.99.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "379e2a34436df24cf8e9a7df10412d49b2cfc550081bf4fa40f101b1cea5fe69"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.99.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10a80d997fc089caa36444bd84b353d14e107e650891c0507946a3d5d1ae21e6"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
