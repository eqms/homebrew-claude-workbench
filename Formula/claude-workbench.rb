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
      url "https://github.com/eqms/claude-workbench/releases/download/v1.0.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "004a9687c63e7a155ff217117bbec4076c2866b6a72bc3ca3baf0d6617272e1b"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.0.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "e647ab1775b47b8ccf3c2ffa9bde3b234d24d338e05696a9db2f7650bc4516bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v1.0.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24b180c8f78b9c87bfebf5d94e4336599a50254ca8ccbe7bfd1b43f36f3fd423"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v1.0.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e04cfa1f7ad07364e8ac3e85a88250e694bd14949014d29b18c5565e0b72137"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
