cask "cmux-chromium" do
  version "0.64.7-chromium.64"
  sha256 "56956af766d92b90b36511769593462ee765a0310d00fc9c33ce1885e8e22163"

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
