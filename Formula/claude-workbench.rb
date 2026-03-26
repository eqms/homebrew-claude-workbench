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
      url "https://github.com/eqms/claude-workbench/releases/download/v0.72.0/claude-workbench-aarch64-apple-darwin.tar.gz"
      sha256 "bce8612743634a991ee3c90db46db9edaecb3e050b0a167714c1153921197693"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.72.0/claude-workbench-x86_64-apple-darwin.tar.gz"
      sha256 "ce7d7eac6d3adbd57730553b78b72bc1126bbc2af9caebaa9eeb15f892f096e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eqms/claude-workbench/releases/download/v0.72.0/claude-workbench-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e00f58eb8d4cf5836b15fd2da145b3ed21e369aa38024092ba10cc53d9919a10"
    else
      url "https://github.com/eqms/claude-workbench/releases/download/v0.72.0/claude-workbench-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0d30103f21f147f7abf145f2b0f914cf24a16eeb18ac484ae598871b83bc5af"
    end
  end

  def install
    bin.install "claude-workbench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-workbench --version")
  end
end
