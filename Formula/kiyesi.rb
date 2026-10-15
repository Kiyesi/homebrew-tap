# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.28.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "b8f74d918ada9fe36921dbd1694a195d960233afeb185e9a864d628b8d78bbec"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "6225c5375e1fed3651d502d6b98145536563e25aa0a418eedb77a5fbe6cfcf98"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "2cd4a4e8025d385f175d1d084e7c0e52353f761af4840bcb12df6188c8a0a1a3"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "24a145050b33d70f66c19dd69b146a308ef7831dbed40f57d0093312b6878e3d"
    end
  end

  def install
    bin.install Dir["kiyesi-*"].first => "kiyesi"
    generate_completions_from_executable(bin/"kiyesi", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiyesi version")
  end
end
