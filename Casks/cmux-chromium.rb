cask "cmux-chromium" do
  version "0.64.7-chromium.60"
  sha256 "2a709332145feeea4ab6252587ab809d67c3252c3bd95bfed01d7285276500c4"

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
