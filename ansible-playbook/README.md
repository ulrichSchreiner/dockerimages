# Ansible Playbook Container

Use this container to run playbooks (and only playbooks). You should have a running `ssh-agent` to connect to your hosts.

Put this in your `.bashrc`:
```bash
_ansible() {
  docker run -it --rm -v $SSH_AUTH_SOCK:/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent -v `pwd`:/work ulrichschreiner/ansible-playbook "$@"
}

alias ansible-playbook=_ansible
```

Now create an inventory:
```
[myhosts]
1.2.3.4 ansible_user=myuserid
```

and create a playbook:
```yaml
---
 - hosts: myhosts
   become: yes
   gather_facts: no
   pre_tasks:
    - name: 'install python2'
      raw: apt-get -y install python-simplejson
   tasks:
    - shell: echo "Hello "
```

Note: in this example i install a python2 in a `pre_tasks` with `gather_facts: no`. This is only an example!

Now run your playbook. You must start the image in the same directory with your configuration files. As they are mounted into the 
container, you cannot reference files on your hosts system:
```bash
ansible --ask-become-pass -i inventory site.yaml
SUDO password: 

PLAY ***************************************************************************

TASK [install python2] *********************************************************
ok: [myhosts]

TASK [command] *****************************************************************
changed: [myhosts]

PLAY RECAP *********************************************************************
myhosts     : ok=2    changed=1    unreachable=0    failed=0   

```
