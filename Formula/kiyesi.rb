# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.39.3"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "491f3a7b33082e429ab22390534da9c1d35147a1eff12a67eca0338101356b02"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "14f4db8caef6ad03d95feda82fa2419a5728f3127f22db7429846f4453049e26"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "871b709c7bff8ee2191752e3460670354b0b3a6216668b8c6a62290dbb70d71d"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "1db487eef44e59d52e158c1d37162b5a3fb706197d89a988a810cced28968cb8"
    end
  end

  def install
    bin.install Dir["kiyesi-*"].first => "kiyesi"
    # The release is one file, not an archive, so it arrives without the
    # permission to run: give it that before anything runs it.
    chmod 0755, bin/"kiyesi"
    generate_completions_from_executable(bin/"kiyesi", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiyesi version")
  end
end
