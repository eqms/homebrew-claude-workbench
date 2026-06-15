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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.98.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "40471bda63ee30f3cd989c52996d5626ad0b79ebbeec80cce5aa5eaef5cb126d"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.98.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "15085d3f1ab858f3587ec7972ea82102489075ca90b1c0c568a3695eacaabdda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.98.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "848abfd9ad74cda875cf8368104a749ab636ac7d69786dc7a5a89fc23554c7e1"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.98.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f47fd0db5bb2e785e77433236615cdc8e672d62b9ba6d59eb7908423c9978b67"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
