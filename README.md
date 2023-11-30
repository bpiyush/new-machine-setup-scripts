# NeMeSeS: NEw-MachinE-SEtup-Scripts
Bunch of scripts useful to add when starting on a new machine


## How to use this repository?

On your new machine, run:
```bash
git clone https://github.com/bpiyush/new-machine-setup-scripts.git
```
This will clone the repo and you are ready to go!

Most parts of this repo are borrowed from [here](https://bpiyush.github.io/ml-engg-docs/new_machine.html). Check it out for longer version.

## Aliases

See [bash_aliases.sh](bash_aliases.sh) for useful aliases and useful bash utility functions. You may add a file `.bash_aliases` in your home directory, you can simply copy the relevant file:

```bash
cp bash_aliases.sh ~/.bash_aliases
```

Do not forget to source it in `.bashrc`:
```bash
if [ -f ~/.bash_aliases ]; then 
    source ~/.bash_aliases
fi
```

## Git SSH keys

In order for seamless github functioning, it is advised to set SSH creds instead of using password everytime you use git. Refer to [`set_git_creds.sh`](set_git_creds.sh) for more details. Run:
```bash
bash set_git_creds.sh
```
Now, the public key will be copied to your clipboard. On github, go to Settings > SSH & GPG keys > Add new key -> Add the key!

## Aesthetics

### Set colors

For colorful `ls` command, set the following in your `~/.bashrc`
```sh
alias ls='ls --color=always'
```

### Set terminal prompt

```sh
# Set the terminal prompt
function parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="=> \[\033[32m\] \W\[\033[34m\]\$(parse_git_branch)\[\033[00m\] [\A] $ "
```

## Programming

### Setup `miniconda`
Download the relevant installer from [here](https://docs.conda.io/en/latest/miniconda.html#linux-installers).
```bash
cd /your/desired/location/
# replace the link with link to your relevant installer
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
```

Run the installation:
```bash
bash Miniconda3-py39_4.10.3-Linux-x86_64.sh
```

If you'd prefer that conda's base environment not be activated on startup,
set the auto_activate_base parameter to false:
```bash
conda config --set auto_activate_base false
```

### Setup `virtualenv`

This may be already installed by root. Check `virtualenv --version`.

### Setup `tmux`

This may be already installed by root. If not, ask your root to install it.

### Useful keyboard shortcuts for terminal

Please follow this [stackoverflow answer](https://stackoverflow.com/questions/12335787/with-iterm2-on-mac-how-to-delete-forward-a-word-from-cursor-on-command-line).

### Setup VSCode for remode code editing

Install VSCode on your local Machine (e.g. Mac). You can edit repositories on your remote machine simply by the power of VSCode + SSH. Install the [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) and you should be done!
