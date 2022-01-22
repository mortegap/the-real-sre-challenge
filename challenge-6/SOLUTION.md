# Challenge 6

Setup commands on Ansible Node (my machine):

```
$ sudo apt update && sudo apt-add-repository -y --update ppa:ansible/ansible
$ sudo apt update
$ sudo apt install ansible -y
```

- Add the server on the inventory.

```
$ sudo vim /etc/ansible/hosts
```
[image](hosts.png)

```
$ ansible all -m ping -u ubuntu
```
[image](ping.png)

- Install docker.
  build the image from Dockerfile (challenge-4).
  Deploy the image on the server.

main.yml:

- name: "[CHALLENGE 6] Deploy container"
  hosts: all 
  tasks:

    - name: Copy challenge-4
      ansible.builtin.copy:
        src: ../challenge-4
        dest: /tmp/

    - name: Add Docker GPG apt Key 
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker Repository
      apt_repository:
        repo: deb https://download.docker.com/linux/ubuntu bionic stable
        state: present

    - name: Update apt and install docker-ce
      apt: update_cache=yes name=docker-ce state=latest

    - name: Install Docker
      pip:
        name: docker

    - name: Build Dockerfile
      docker_image:
        name: challenge-6:v1.0
        source: build
        build:
          path: /tmp/challenge-4

    - name: Deploy container
      docker_container:
        name: challenge-6
        image: challenge-6:v1.0
        ports:
          - '83:8081'

I changed the ports because I have other dockers on that ports on same Raspberry.

Apply playbook:

```
$ ansible-playbook main.yml -l myremote -u ubuntu
```

- Check if HTTP server is running and response properly.

```
$ curl --header "Challenge: intelygenz.com" 192.168.1.21:83
```

> Output:

Everything works!

- Save the output of the ansible-playbook execution in ansible.log file and upload.

```
$ ansible-playbook main.yml -l myremote -u ubuntu > ansible.log
```

I comment the installation steps because I had already docker installed on raspberry.

- Group tasks with tags.

- name: "[CHALLENGE 6] Deploy container"
  hosts: all 
  tasks:

    - name: Copy challenge-4
      ansible.builtin.copy:
        src: ../challenge-4
        dest: /tmp/
      tags:
        - configure

    - name: Add Docker GPG apt Key 
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present
      tags:
        - install

    - name: Add Docker Repository
      apt_repository:
        repo: deb https://download.docker.com/linux/ubuntu bionic stable
        state: present
      tags:
        - intasll

    - name: Update apt and install docker-ce
      apt: update_cache=yes name=docker-ce state=latest
      tags:
        - install

    - name: Install Docker
      pip:
        name: docker
      tags:
        - install

    - name: Build Dockerfile
      docker_image:
        name: challenge-6:v1.0
        source: build
        build:
          path: /tmp/challenge-4
      tags:
        - install

    - name: Deploy container
      docker_container:
        name: challenge-6
        image: challenge-6:v1.0
        ports:
          - '83:8083'
      tags:
        - always
