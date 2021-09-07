# new-machine-setup-scripts
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

### Set terminal prompt

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