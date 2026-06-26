cask "cmux-chromium" do
  version "0.64.17-chromium.91"
  sha256 "a232dd50d8ec336825a6c8f77ec7fef8433a0b267e8df2b83bbe67d5f7943fcb"

  url "https://github.com/TimoBechtel/cmux/releases/download/chromium-#{version}/cmux-chromium-macos-arm64.zip"
  name "cmux Chromium"
  desc "Terminal workspace with a Chromium browser engine"
  homepage "https://github.com/TimoBechtel/cmux"

  livecheck do
    url :url
    regex(/^chromium[._-]v?(\d+(?:\.\d+)+(?:-chromium\.\d+)?)$/i)
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "cmux Chromium.app"
  binary "#{appdir}/cmux Chromium.app/Contents/Resources/bin/cmux"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/cmux Chromium.app"]
  end
end
