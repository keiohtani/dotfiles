uname=$(uname)

if [[ $uname = 'Linux' ]]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_github
elif [[ $uname = 'Darwin' ]]; then
	ssh-add -K ~/.ssh/id_rsa_github
fi