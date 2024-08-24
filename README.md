# Bootstrapping for Ansible

Set up a freshly installed machine with the minimum requirements for further remote configuration with [Ansible](https://www.ansible.com/).
The script will:

- Upgrade packages
- Install OpenSSH and Python
- Set up key-based SSH root login
- Display local IP addresses


## Security

It is risky to execute a script from an untrusted source on your machine as root.
Your machine's security is your responsibility.


## Supported platforms

- OpenBSD
- Arch Linux
- Alpine Linux
- Fedora Linux
- Termux


## Usage

As root, run:

```sh
curl -L bootstrap.malte.cz | sh
```


## Other users

Assuming your GitHub username is `otto`, authorize root login via SSH with your own keys:

```sh
curl -L bootstrap.malte.cz | sh -s -- otto
```
