# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.42.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "56c9987258dc848ce5089de4f3845f3337c93803121a43f358ae93b62b73d25d"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "47e726e69b3473fdfc5ee63ee04409c74c5441864f89a41a2bccdb06faad4a29"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "00aecf511c253d331094c008ae18d592b6e6d0e631b08f1abee3934f290519a5"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "bdb2e97dc2a1b4b6841464b9128233785aa6320ed5fcc9acedee207ec16a53e0"
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
