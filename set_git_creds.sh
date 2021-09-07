
# set email and username
git config --global user.name "Piyush Bagad"
git config --global user.email "piyushnbagad11@gmail.com"

# generate SSH key pair and copy the public key to be added to github
eval `ssh-agent`
ssh-add -l

ssh-keygen -t rsa -b 4096 -C "piyushnbagad11@gmail.com"
cat ~/.ssh/id_rsa.pub

# after this, go to Settings > SSH & GPG keys > Add new key -> Add the key!
echo "Public key copied! Now go to Settings > SSH & GPG keys > Add new key -> Add the key!"