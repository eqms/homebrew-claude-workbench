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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.78.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "0be82f5af6aca2e12363acd8c50f0a52060c0ed03bf92a631cec706fa3c7119a"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.78.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "0e9fd00f601324a8508aa103400516cb4fdfd7aa1532b193922d65dce16a3bb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.78.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "015d74f9de9285daae2b6bee39c699fe832960259ff3a5620d14ae4b6e465700"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.78.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be4002da12c3b7be5cbc9e409f176888007dcccccb1a3803e1a4babbe86ae10a"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
