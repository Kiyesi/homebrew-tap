# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.40.0"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "b35a83de2f933a15c401375ddf50f823c3dc4d227ec5c8c9e3ae8026d936826d"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "4acf6a097aa62dcb409d76e0b7f877ea3c94dc43db12619cbdf8b477f32d0adc"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "628279afcf34d8e117fdd28b32fdf4ad81552e83915376f655dbc85e427b1021"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "40f404d5242fef135821a49dd76a8025906e96ae4322bf430d9e38f565677419"
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
