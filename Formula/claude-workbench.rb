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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.80.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "f35d1f43f608fdb00f8e9f927104004d8709e83a4a6ebacc4fe3da59cf11f2f9"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.80.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "9816915eaedf38e21eefa954b3c59c4dfe42e679f4408bf2109dbf69558affb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.80.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f641946c2726a2e2955b1db5ffaeadf078ec26feb019b65966f12eaedd18e0dc"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.80.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eba474ccb3853547b547560ba7a50b5ed1dc158cefed696c609e60b5fa1c2da7"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
