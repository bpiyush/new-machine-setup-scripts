# Run this script locally: bash passwordless_ssh.sh -m fs2.das5.science.uva.nl -u pbagad

# get inputs from the user
while getopts "m:u:" OPTION; do
    case $OPTION in
        m) machine_ip=$OPTARG;;
        u) username=$OPTARG;;
        *) exit 1 ;;
    esac
done

keyname="id_rsa_"$HOSTNAME"_to_$machine_ip"
loginid="$username@$machine_ip"

# generate SSH key pair on local machine
ssh-keygen -t rsa -b 4096 -C "SSH Keypair for $machine_ip" -f ~/.ssh/$keyname
chmod 400 ~/.ssh/$keyname

# copy the public key to remote machine
ssh-copy-id -i ~/.ssh/$keyname $loginid

# print out the command
echo "Use ssh -i ~/.ssh/$keyname $username@$machine_ip to login to remote machine without password."
echo "TIP: You can put this as an alias to save time."
