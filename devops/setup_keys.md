# Setup SSH keys for F13CyberTech Gitlab access

## Gitlab Supported SSH key types

To communicate with GitLab, you can use the following SSH key types:

- ED25519
- RSA
- DSA (Deprecated in GitLab 11.0.)
- ECDSA (As noted in Practical Cryptography With Go, the security issues related to DSA also apply to ECDSA.)

## Information about `-b` switch

Which specifies the number of bits in the key to create. For RSA keys, the minimum size is 1024 bits and the default is 3072 bits. Generally, 3072 bits is considered sufficient. DSA keys must be exactly 1024 bits as specified by FIPS 186-2. For ECDSA keys, the -b flag determines the key length by selecting from one of three elliptic curve sizes: 256, 384 or 521 bits. Attempting to use bit lengths other than these three values for ECDSA keys will fail. ECDSA-SK, Ed25519 and Ed25519-SK keys have a fixed length and the -b flag will be ignored.

## Generate SSH key pair

`ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa` or `ssh-keygen -t ed25519 -b 521 -f ~/.ssh/id_ed25519`

## Upload keys to F13CyberTech Gitlab

<https://git.f13cybertech.com/-/profile/keys>

## Configure ssh client

Edit `~/.ssh/config` and add lines to easily connect to gitlab.

```bash
Host gitlab-here
        Hostname git.f13cybertech.com
        Port 22

Host *
        User lichnovs
        IdentityFile ~/.ssh/id_ed25519
        Protocol 2
        Compression yes
        LogLevel INFO
```

## Setup ssh agent to read the keys

Edit `~/.zshrc` and add function, which you can call, when terminal loads itself.

```bash
onstartload ()
{
        cd ~ && eval $(ssh-agent) && ssh-add && clear
}
```

## Edit known_hosts

Edit `~/.ssh/known_hosts` and add lines to easily connect to gitlab without ssh errors.

```bash

@cert-authority *.f13cybertech.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIzQHKjJcdGgHgnVZOovlpl7qzsMrvwjWuaZDEtDUilQ5vbpUFG+Xqg7IiIKvDfFd76KWHk1QwUDOfJGNetik5S7T1GfVPmkVO7RpGzFB7AhMvvQA6hr1G1+hRZ3fypBNK163poe6VMuKYCt78GmuEjNaUS2ukQTZaF4kWAWTeRv3daQJpcNNWuDww28/+Iijf/4ybrA+C6uzoYjM10ReInOAUciHPVIlps98SuxwB12GovZJlJOh9xHKnrqSK9Xk/a7lRycSjlAiWSn8UBu9tc+XDKpnT37hz2lakruNNjLyxjJAOGPepWnjz9Q+GI+u440VVwxw79YNzydcMNQi/RZFbwXSx7HhdItIX0iAPWsk2Raho2iwIaW44gqejls7W0ToGu7OdtVzfYWXdnHXoUf/lNiGJswwoifkHCS7VNqfcJElvBt3nppHTeACvebbGYJw+kTzuSbXSxxMsrNqF+57MvUd5DdFbiyENQSYigHbF4yXxS355vDVWXoTT8n3L52iHeXDabG4AiqaaP020bUXnSPiCjzdlT1nlBVeWgmHGwedXNRemJiX5M9iGSVkmPkkeC18o7gVwSsKsZ8OjKkt9Ak51n2BgRhg2Q6bexlcb258nlpfkJyqyc315cRYybEEOQjsbYOK2XW+Az6WxDGSLp4jwhbL50IN/zatilQ==
```
