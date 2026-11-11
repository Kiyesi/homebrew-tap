# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.50.1"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "fd70c8561ad40da1f6bb6ab5cd9800d6d9a3e2f8fe55506bc849e7a7a53ee542"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "910eb6bde5f09e1113644d387390cb76fa69848ff23033ccf7e9b9ec8ed6b5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "4d64d88e3021be4e04014c26c87ad33d140cabfc8648bd31f112de843d2f95a1"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "40a4537683427351f0e38ad0705efaea878b091291850fcfa32cd950075b70fe"
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
