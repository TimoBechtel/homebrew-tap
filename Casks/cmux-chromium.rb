cask "cmux-chromium" do
  version "0.64.10-chromium.72"
  sha256 "24ae647a47423a48517c1c1e7993c2abd733c8ae06c6a19d33412a84babb164e"

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
