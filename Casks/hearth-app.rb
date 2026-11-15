cask "hearth-app" do
  version "0.1.6"
  sha256 "bbaf3d2a6bf2cafdcb6d97a88e8bfb2c2f0a158c1ae6c72323116d050b7012ec"

  url "https://github.com/ducheharsh/hearth/releases/download/v#{version}/Hearth-#{version}.dmg"
  name "Hearth"
  desc "Menu bar app for hearth, the home server for your Mac"
  homepage "https://github.com/ducheharsh/hearth"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"
  conflicts_with formula: "ducheharsh/tap/hearth"

  app "Hearth.app"

  uninstall launchctl: "dev.hearth.hearthd",
            quit:      "dev.hearth.app"

  zap trash: [
    "~/Library/LaunchAgents/dev.hearth.hearthd.plist",
  ]

  caveats <<~EOS
    Hearth isn't notarized yet. If macOS blocks it, install with:
      brew install --cask --no-quarantine ducheharsh/tap/hearth-app
    Your settings and app data in ~/.hearth are kept on uninstall.
  EOS
end
