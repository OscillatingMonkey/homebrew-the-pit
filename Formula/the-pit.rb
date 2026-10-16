class ThePit < Formula
  desc "Encrypted local secrets vault with an integration rail"
  homepage "https://github.com/OscillatingMonkey/the-pit"
  url "https://github.com/OscillatingMonkey/the-pit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5a48981fca857a30d636f859b4f4bbdaaadfe93c04597c351db6be86323d5525"
  license "MIT"
  head "https://github.com/OscillatingMonkey/the-pit.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Create your vault and keep the agent running:
        pit init
        pit service install
    EOS
  end

  test do
    assert_match "pit #{version}", shell_output("#{bin}/pit --version")
  end
end
