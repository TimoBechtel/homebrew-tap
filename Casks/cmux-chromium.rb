cask "cmux-chromium" do
  version "0.64.17-chromium.96"
  sha256 "46d5eb9e181805ef5759c3657d16d5b6df177127f5bfbc2690bc9f65ea0337c4"

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
