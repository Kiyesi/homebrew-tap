# Written by scripts/release.sh in Kiyesi's repository for each release.
class Kiyesi < Formula
  desc "Checks the health and security of your servers, and tells you how to fix them"
  homepage "https://kiyesi.dev"
  version "0.48.2"

  on_macos do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-darwin-arm64"
      sha256 "1d61cebbbdb3f79b7927317472b36669edee69b3086e5fee83b812c0f95fca8c"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-darwin-amd64"
      sha256 "0ab481a2337073466cc22afb70f0ae344f8717009f95ced85dc05e53302444c6"
    end
  end

  on_linux do
    on_arm do
      url "https://get.kiyesi.dev/kiyesi-linux-arm64"
      sha256 "8cca65afdfd48c1da25150e48632766f1505e61cfc1b407fc4825b7a5ea57b0d"
    end
    on_intel do
      url "https://get.kiyesi.dev/kiyesi-linux-amd64"
      sha256 "a3b3714cebf910191919d2f541a115023e22617c3e1387177d5390061a8c4e1c"
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
