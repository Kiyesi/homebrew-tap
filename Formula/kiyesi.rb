# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.27.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "051418738024e41eeb1e3ba906cdd74030725d0ef19d37b345bb8e2104f85485"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "23891796a545fc05447a75883b4dd4f56fe1388c5b9ff5d4cd44deca83d747ff"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "71dae0a6c37edf38b8cb290481df51ff1011ef476e263c3c085393b4adc09762"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "ddac0f44f19634c354ded1c3aabbf128cfabe463f0c6b179c820d8d1a604183e"
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
