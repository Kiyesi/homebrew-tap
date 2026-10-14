# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.27.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "3ff02a879ae480b876c750e2302525fa4207429c8b9f1dec87397abb9d4ebdb9"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "cb00eed7f9211377e41ef9e4e7ad0e0c0acf86e90a73dfe124b677b631c974f8"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "7c441b2acd0c92187debed62335039ca48d1cfe820e4131dc282fe4d66135e51"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "29fcc040b8aa675ad8562bb6c578268e7fa38effeba0d15442b8d8bf85b15c86"
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
