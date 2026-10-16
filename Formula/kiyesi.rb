# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.32.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "0c89c90614aa1ae0132793e710e7109e87b25a5bf3bb040fd16b4bbb6822215b"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "0a434e0780b64f3a82f25cce78ee39979722c3bb6674194a88ada53af92dc29e"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "9357618e28c67f2cab0a170f1e3560bd5c4048cc6cb6962dc52813dc4a445d54"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "b5e02777119ded3505a16518ac3ac1adff23e8289065530af3a47f513edde278"
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
