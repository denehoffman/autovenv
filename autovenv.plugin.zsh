find_and_activate_venv() {
    local dir="$1"
    while [[ "$dir" != "/" && "$dir" != $(dirname "$HOME") ]]; do
        venv_activate="$dir/.venv/bin/activate"
        if [[ -f "$venv_activate" ]]; then
            source "$venv_activate"
            return 0
        fi
        dir=$(dirname "$dir")
    done
    return 1
}
on_cd() {
    emulate -L zsh
    if [[ -n "$VIRTUAL_ENV" ]]; then
        virtual_env_parent=$(dirname "$VIRTUAL_ENV")
        if [[ "$PWD" != "$virtual_env_parent"* ]]; then
            deactivate
            find_and_activate_venv "$PWD"
        fi
    else
        find_and_activate_venv "$PWD"
    fi
}
chpwd_functions+=(on_cd)
