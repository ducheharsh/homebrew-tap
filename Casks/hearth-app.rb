cask "hearth-app" do
  version "0.1.3"
  sha256 "4294c5e28a9a1ce29360c34346a11865831e182cbd59da38ac3f4c26b696091c"

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
