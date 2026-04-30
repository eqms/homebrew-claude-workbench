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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.87.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "1fab8d56bd58f1b19cc1311c7fa853f77a7dd0fcdde2ee9b6cadf470fec08027"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.87.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "71ec0f83a8c362e0db52a35f4b5c3b0d56d81eb961f059feb4dbe76b616e97e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.87.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4489460c5be9aaaabce02f6ea856550d193f88aadc1656886383f02b002a5ad5"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.87.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26c66c01f5570b661d2cd72a29ed942ab6001f4237aae242c189d3bfc025f077"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
