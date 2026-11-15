<p align="center"><img src="https://raw.githubusercontent.com/ducheharsh/hearth/main/docs/assets/ember.svg" width="64" alt=""></p>

# ducheharsh/tap

Homebrew tap for [**hearth**](https://github.com/ducheharsh/hearth), the home server for your Mac.

```bash
# The daemon, run as a login service
brew install ducheharsh/tap/hearth
brew services start hearth

# Or the menu bar app (includes the daemon)
brew trust ducheharsh/tap            # newer Homebrew asks before loading third-party casks
brew install --cask ducheharsh/tap/hearth-app
```

Install one or the other. Then open http://127.0.0.1:9000.
