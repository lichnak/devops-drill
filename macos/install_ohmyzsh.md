# Install MacOS iTerm2 and Oh My Zsh

## Install iTerm2, zsh and Oh My Zsh

```bash
brew install --cask iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

upgrade_oh_my_zsh
```

## Change default theme

```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

export ZSH_THEME="powerlevel9k/powerlevel9k"
```

## Install fonts

```bash
git clone https://github.com/powerline/fonts.git

cd fonts

./install.sh
```

To change the font, navigate to `iTerm2 > Preferences > Profiles > Text > Change Font`.

Now, you can see Inconsolata listed as one of the fonts. Select your preferred font. For fonts that support ligatures like FiraCode, check the “Use ligatures” option to view your arrows and other operators in a stylish manner like ( → ).

## Change iTerm2 color scheme

<https://github.com/mbadolato/iTerm2-Color-Schemes>

```bash
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
```

Navigate to `iTerm2 > Preferences > Profile > Colors > Color Presets > Import`

* Navigate to the schemes folder and select your preferred color schemes to import them.
* Click on a specific color scheme to activate it. In this scenario, I activated Batman which is my preferred color scheme.

## Install Oh My Zsh plugins

Oh My ZSH comes preloaded with a git plugin. To add more, for instance, docker, auto-suggestion, syntax highlighting and more:

```bash
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
```

* Head over to `.oh-my-zsh > custom > plugins` directory to view the cloned directory. To access this, run the command `open ~/.oh-my-zsh`
* Add the plugin to the plugin section of the config file `~/.zshrc` shown below
* Update your changes by running the command `source ~/.zshrc`

## Configure zsh

```bash
# Pyenv configuratin lines
export PYENV_ROOT=$(pyenv root)
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=$HOME/.virtualenvs   # Optional
export PROJECT_HOME=$HOME/sources      # Optional
source /usr/local/bin/virtualenvwrapper.sh

# Powerline configuration
if [ -f /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# Powerline theme Powerlevel9k
# https://github.com/Powerlevel9k/powerlevel9k
if [[ $OSTYPE == darwin* ]]; then
    zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{green}'

                [[ $speed -gt 100 ]] && color='%F{green}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
        fi
    }
elif [[ -x $(command -v nmcli) ]]; then
    zsh_wifi_signal(){
        local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
        local color='%F{yellow}'
        [[ $signal -gt 75 ]] && color='%F{green}'
        [[ $signal -lt 50 ]] && color='%F{red}'
        echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
    }
else
    zsh_wifi_signal(){
        # No WiFi or no way to find WiFi signal.  Null function.
    }
fi

export POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true
export VIRTUAL_ENV_DISABLE_PROMPT=0
export NODE_VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context user dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time pyenv ssh ip custom_wifi_signal battery)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time date pyenv ssh)
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
POWERLEVEL9K_HOST_ICON="\uF109 "
POWERLEVEL9K_SSH_ICON="\uF489 "

# Optionally to hide the “user@hostname” info
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# update all repositories in folder
batchpull ()
{
        find $(pwd) -mindepth 1 -maxdepth 1 -type d -print  | while read repo; do cd "$repo" && echo "===Sync ... $repo===" && git pull --all && git fetch --all && git reset --hard HEAD; done
}

# create directory and change location to it
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

# Change location to home dir and load ssh key with ssh agent
onstartload ()
{
        cd ~ && eval $(ssh-agent) && ssh-add && clear
}

# Reload shell
reloadshell()
{
    exec "$SHELL"
    source ~/.zshrc
}

# Imgcat setup
imgcat ()
{
  bash ~/.scripts/imgcat.sh "$1"
}
```
