class ThePit < Formula
  desc "Encrypted local secrets vault with an integration rail"
  homepage "https://github.com/OscillatingMonkey/the-pit"
  url "https://github.com/OscillatingMonkey/the-pit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "70b4a38b5591e5afd3c5e42734666b897d3161f8e99c220b8199f31dc771f2b6"
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
