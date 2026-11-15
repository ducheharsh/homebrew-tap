cask "hearth-app" do
  version "0.1.4"
  sha256 "4fb8b612f978aa57a0c7985117ef7d127e7e5c876918738636350c23b300c627"

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
