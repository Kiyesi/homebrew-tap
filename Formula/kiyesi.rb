# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.26.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "0880cfb879f953ecc4928a37a1c8dd0bd6a59e75d23f2832ce2062fe060c59df"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "b5f8858f3ecbccc59f362966b86b46a970c2510a6b2bb7dc2d8783170c09ad2d"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "536121a4f19f87e4b9744b0ebdc4f1fd2998bb9467165edc965f96629097e2e8"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "f41a339eb0e4f99661bbc5f8ef8d5231ec308e130f3d38e52e4a34066d0e2254"
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
