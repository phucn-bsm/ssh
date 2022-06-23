# Simple SSH server for testing purpose

### Required Stack
This project requires the following stack
- Docker
- WSL2

### Setup Project

Open terminal and change working directory to this project.
```bash
cd path/to/project
```
Create `.env` from `.env.example`. Open `.env` file in an editor, you can specify the port of SSH by changing the value of variable name `SSH_PORT`

Build Docker image via Docker compose
```bash
docker compose build
```
After building done, start Docker stack.
```bash
docker compose up -d
```

### Connect to server via SFTP
Use an SSH application to connect to server via SFTP (recommend [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html)).

You can connect to server with the default user created in the image - `theusername`
Credential of connection:
- Host name: `localhost` (or `host.docker.internal` for Window)
- Port: the port you configure in the `.env` file. Default is `9023`
- Username: `theusername`
- Private key: Choose the file `keys/theusername/theusername.pem`
- Passphrase: no passphrase

![Setup Connection](/assets/sftp-connection.jpg)
![Good Connection](/assets/good-connection.jpg)