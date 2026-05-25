class HeyComma < Formula
  desc "Run shell commands using natural language"
  homepage "https://github.com/TimoBechtel/hey-comma"
  version "1.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TimoBechtel/hey-comma/releases/download/v#{version}/hey-darwin-arm64"
      sha256 "08ec4a7359e5c74811e5cb30992d130f02de5572984d9e2de25aec7bb189706f"
    else
      url "https://github.com/TimoBechtel/hey-comma/releases/download/v#{version}/hey-darwin-x64"
      sha256 "246d26096639ca0e55e0eedbcd9ead1a6e45d914cfbde393c8ae20da96fedbf4"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TimoBechtel/hey-comma/releases/download/v#{version}/hey-linux-x64"
    sha256 "954f6611ea8b5f6ba63aded8adf5fb9a29270861e4f1901a4558d72edf14caa5"
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "hey-darwin-arm64" : "hey-darwin-x64"
    else
      "hey-linux-x64"
    end

    bin.install binary_name => "hey"
    bin.install_symlink "hey" => "hey,"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/hey --help")
  end
end
