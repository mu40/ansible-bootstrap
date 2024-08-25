# Bootstrapping for Ansible

Set up a freshly installed machine with the minimum requirements for further remote configuration with [Ansible](https://www.ansible.com/).
The script will:

- Upgrade packages
- Install OpenSSH and Python
- Set up key-based SSH root login
- Display local IP addresses


## Supported platforms

- OpenBSD
- Arch Linux
- Alpine Linux
- Fedora Linux
- Termux


## Usage

As `root`, run:

```sh
curl -L bootstrap.malte.cz | sh
```


## Other users

Assuming your GitHub username is `otto`, authorize root login via SSH with your own keys:

```sh
curl -L bootstrap.malte.cz | sh -s -- otto
```


## Security

The script is not intended for public consumption or to ensure a secure SSH setup.
Executing code from an untrusted source, especially as root, is risky.
It might, for example, delete your data or send it elsewhere.
The security of your machine and your data is your responsibility.
