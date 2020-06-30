#! /bin/bash

sed -i 's/__SSH_USER/'"$SSH_USER"'/g' /ansible/inventory
# sed -i 's/__SSH_PASS/'"$SSH_PASS"'/g' /ansible/inventory
sed -i 's/__SSH_HOST/'"$SSH_HOST"'/g' /ansible/inventory

chmod 0600 /ansible/privatekey/privatekey.pem

ansible-playbook -i /ansible/inventory --private-key /ansible/privatekey/privatekey.pem /ansible/playbook.yml