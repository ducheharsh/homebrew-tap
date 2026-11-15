cask "hearth-app" do
  version "0.1.5"
  sha256 "9c845de63eab31edc5494fe3dd22a54ecc684d77fc76792ac77a7abefc6a3e59"

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
