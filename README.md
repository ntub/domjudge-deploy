# DOMjudge Deploy

## Steps

1. Setup ssh key login and no password sudo.

    ```bash
    # If your key is ~/.ssh/id_rsa.pub.
    ansible-playbook playbooks/setup_no_password_login.yml --ask-pass --ask-become-pass -l 'server'
    
    # If you want to custom public key.
    ansible-playbook playbooks/setup_no_password_login.yml --ask-pass --ask-become-pass -e ssh_public_key_file=~/ssh/key.pub -l 'server'
    ```

2. Setup server.

    ```bash
    ansible-playbook playbooks/setup_server.yml -l 'server001'
    ```

## Todo

- [] Deploy domserver.
