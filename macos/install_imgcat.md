# Install Image Cat in iTerm2

## Prerequisities

* Installed Homebrew
* Installed iterminal `iTerm2`
* Installed cli tools `awk`, `base64`, and `wc`

## Download the script

```bash
mkdir -p ~/.scripts
curl -sSLo ~/.scripts/imgcat.sh https://iterm2.com/utilities/imgcat
chmod 0744 ~/.scripts/imgcat.sh
```

## Add the script to PATH or create custom function

**Option 1** Adding `~/.scripts` to enviromental variable PATH

```bash
export PATH="$HOME/.scripts:$PATH"
```

**Option 2** Adding custom executor function into `~/.bashrc` or `~/.zshrc`

```bash
imgcat ()
{
  bash ~/.scripts/imgcat.sh "$1"
}
```
