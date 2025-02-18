FROM gitpod/workspace-full:latest

RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.5.0/powershell_7.5.0-1.deb_amd64.deb && \
    sudo add-apt-repository universe && \
    sudo dpkg --force-all -i powershell_7.5.0-1.deb_amd64.deb && \
    rm powershell_7.5.0-1.deb_amd64.deb
