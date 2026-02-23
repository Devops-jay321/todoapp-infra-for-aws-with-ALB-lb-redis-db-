#!/bin/bash
    sudo su
    apt-get update && apt-get install -y curl gnupg2 unixodbc unixodbc-dev

    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg > /dev/null

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/24.04/prod noble main" | \
sudo tee /etc/apt/sources.list.d/mssql-release.list

    apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18

    sudo apt install python3-venv -y
    cd /home/ubuntu
    git clone https://github.com/Devops-jay321/TodoBackendMonolithic.git
    cd TodoBackendMonolithic
    sudo apt install python3-venv -y
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt