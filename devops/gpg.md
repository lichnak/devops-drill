# Add GPG keys to Gitlab commit sign

## Install GPG

```bash
brew install gnupg
```

## Generate gpg key pair

```bash
gpg --full-gen-key
```

## Export gpg public key

```bash
gpg --list-secret-keys --keyif-format LONG adam.lichnovsky@here.com

gpg --armor --export 65A6950000005704
```

## Add public key to your Gitlab profile

You can add a GPG key in your user settings:

1. In the top-right corner, select your avatar.
2. Select Edit profile.
3. In the left sidebar, select GPG Keys.
4. Paste your public key in the Key text box.
5. Select Add key to add it to GitLab. You can see the key’s fingerprint, the corresponding email address, and creation date.

## Configure git to sign commit or push

```bash
echo 'export GPG_TTY=$(tty)' >> $HOME/.zshrc

source $HOME/.zshrc

git config --global user.email=adam.lichnovsky@here.com
git config --global user.signingkey 0E333A68EBA808869400000065A695B39BB35704

git config --global commit.gpgsign true
git config --global push.gpgsign true #optional and only if gitlab requires it
```
