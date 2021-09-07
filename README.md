# new-machine-setup-scripts
Bunch of scripts useful to add when starting on a new machine


## How to use this repository?

On your new machine, run:
```bash
git clone https://github.com/bpiyush/new-machine-setup-scripts.git
```
This will clone the repo and you are ready to go!

## Aliases

See [bash_aliases.sh](bash_aliases.sh) for useful aliases and useful bash utility functions. You may add a file `.bash_aliases` in your home directory, you can simply copy the relevant file:

```bash
cp bash_aliases.sh ~/.bash_aliases
```

Do not forget to source it in `.bashrc`:
```bash
source ~/.bash_aliases
```

## Git SSH keys

In order for seamless github functioning, it is advised to set SSH creds instead of using password everytime you use git. Refer to [`set_git_creds.sh`](set_git_creds.sh) for more details. Run:
```bash
bash set_git_creds.sh
```
Now, the public key will be copied to your clipboard. On github, go to Settings > SSH & GPG keys > Add new key -> Add the key!