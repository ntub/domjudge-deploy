# DOMjudge Deploy

## Steps

1. Setup ssh key login and no password sudo.

    ```bash
    # If your key is ~/.ssh/id_rsa.pub.
    ansible-playbook playbooks/setup_no_password_login.yml -l 'server' --ask-pass --ask-become-pass
    
    # If you want to custom public key.
    ansible-playbook playbooks/setup_no_password_login.yml -l 'server' --ask-pass --ask-become-pass -e ssh_public_key_file=~/ssh/key.pub
    ```

2. Install and setup Docker.

    ```bash
    ansible-playbook playbooks/install_docker.yml -l 'server'
    ```
