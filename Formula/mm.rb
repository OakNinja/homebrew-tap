# typed: false
# frozen_string_literal: true

class Mm < Formula
  desc "Interactively select and run make targets"
  homepage "https://github.com/OakNinja/MakeMe"
  url "https://github.com/OakNinja/MakeMe/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b7f513fc38a3144fa1df318fbbfb98a220a9d09f806c15119020a9bcfe6b987f"

  depends_on "go" => :build
  depends_on "fzf"

  def install
    system "go", "build", "-o", "mm", "./cmd/makeme"
    bin.install "mm"

    # Install shell integration
    pkgshare.install "misc/mm.bash"
    pkgshare.install "misc/mm.zsh"
    pkgshare.install "misc/mm.fish"
  end

  def caveats
    <<~EOS
      To enable shell integration, run the following command for your shell:

      Bash:
        echo "source #{opt_pkgshare}/mm.bash" >> ~/.bashrc

      Zsh:
        echo "source #{opt_pkgshare}/mm.zsh" >> ~/.zshrc

      Fish:
        echo "source #{opt_pkgshare}/mm.fish" >> ~/.config/fish/config.fish
    EOS
  end

  test do
    assert_match "Usage: mm", shell_output("#{bin}/mm -h")
  end
end
