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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.71.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "ffebcc872bbf4d23e9b58f093bc10902ef4ac2725e588988407f3bf1a246109f"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.71.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "70384e532f2c1304d23ef6546661a35e12a28d65be7b587fb1f8d3412c526774"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.71.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d0f1edc315f47dfc6562f7a99b154d4aa6611320508ff2b65ee9fb73f576e68"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.71.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7291a05b306c2dd08e82a75b85f01c27609236848c9180927fc10beea21135c4"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
