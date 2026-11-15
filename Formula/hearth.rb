class Hearth < Formula
  desc "Home server for your Mac: one-click apps, backups, safe updates and one login"
  homepage "https://github.com/ducheharsh/hearth"
  url "https://github.com/ducheharsh/hearth/releases/download/v0.1.5/hearthd-0.1.5-aarch64-apple-darwin.tar.gz"
  sha256 "3d7fe2f47d87097bf510c60f3e49f6c1ce579ff461ec9d9226e2bbbc84bb660d"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hearthd"
  end

  service do
    run [opt_bin/"hearthd"]
    keep_alive true
    process_type :interactive
    log_path var/"log/hearth.log"
    error_log_path var/"log/hearth.log"
    environment_variables RUST_LOG: "hearthd=info,tower_http=warn"
  end

  def caveats
    <<~EOS
      Start hearth now and at every login:
        brew services start hearth

      Then open the dashboard:
        hearthd open        # http://127.0.0.1:9000

      hearth runs apps with Docker: install OrbStack (https://orbstack.dev) or Docker Desktop.
      For access from your phone, install Tailscale and follow Settings → Setup.
      Your settings and app data live in ~/.hearth.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hearthd --version")
  end
end
