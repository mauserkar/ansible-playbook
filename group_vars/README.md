echo "secret-password" > .ansible-vault-password
ansible-vault view files/secrets.yml --vault-password-file .ansible-vault-password
ansible-vault decript files/secrets.yml --vault-password-file .ansible-vault-password
ansible-vault encrypt files/secrets.yml --vault-password-file .ansible-vault-password