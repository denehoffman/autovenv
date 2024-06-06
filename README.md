# AutoVenv: A simple virtualenv switcher

Here's the deal. [`pyenv`](https://github.com/pyenv/pyenv) is nice, but it doesn't really play well with [`uv venv`](https://github.com/astral-sh/uv). But I really like the [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv) automatic switching! Why not skip the middle-man and just implement automatic venv switching in the shell?

Rules:
1. VirtualEnvs must be located in a file called `.venv`. The reason there is no flexibility on this is because it's just another thing to worry about. Just name your venv folder in a standard way!
2. AutoVenv will activate any virtual environment in the current directory, searching backwards until it finds one or hits the `$HOME` directory. It handles all the cases like "what if I'm already in an active venv?" or "what if I nest venvs?" or "what if I exit the directory and there's a venv below it, or none, or whatever else?".
3. Your venvs stay with your projects, as god intented.

# Installation

For [`ohmyzsh`](https://github.com/ohmyzsh/ohmyzsh), the installation is just:
```shell
git clone https://github.com/denehoffman/autovenv.git ~/.oh-my-zsh/custom/plugins/autovenv
```
There's probably a similar method for other `zsh` plugin managers.

# Future Plans

I'd like to have this support most modern shells, it might be fun to learn the same trick in every one.
