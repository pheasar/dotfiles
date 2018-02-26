. "$DOTPATH"/etc/lib/util.zsh

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export LANG="en_US.UTF-8"
export PATH=$PATH:$HOME/bin

if is_osx; then
    export PATH=$PATH:/usr/local/bin:/bin
fi

# anyenv settings
if [[ -d ${HOME}/.anyenv ]]; then
    PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"

    for d in `ls $HOME/.anyenv/envs`; do
        export PATH="$HOME/.anyenv/envs/$d/shims:$PATH"
    done

    export PATH="$HOME/.yarn/bin:$PATH"
fi

# Deploy local settings
if [[ -e ${HOME}/bin_local ]]; then
    PATH="$HOME/bin_local:$PATH"
fi
if [[ -e ${HOME}/.env_local.zsh ]]; then
    source ${HOME}/.env_local.zsh
fi

