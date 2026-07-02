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
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.2/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "4f9bff0ecc6a273025f452f869fc317f6cd53048d0b254340c78cf8f24018246"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.2/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "19f1d05cbfc55ca4b4ee6891ce2eb8e713943cd278751abee56843186a787e94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.2/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "439682f1c0a41837d2c34c91550f732deb662992165bf229aa95ff93e74122e2"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.1.2/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1acdc40b3eb7811a4a0e0e27396a0f7fc5030cafc3f7f5e2fd02db1634166b47"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
