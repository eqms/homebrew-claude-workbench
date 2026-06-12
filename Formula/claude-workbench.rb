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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.96.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "28d3f65c24131b1206481daab22d0313b5e3fa10385506d724575910984ab5ab"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.96.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "7c827d1a4a19ef484b85d6071590d350cf9027b51531f64e1b56f950ef0e3b4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.96.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33e9d27b76e402d09e558f312f48ec62805ce199ab9b8326195dab6c958e8065"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.96.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b31555e90b93c4d66e16f469446a56daed1aa4d5a83dda20661dc77314809b06"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
