# Please run this script as admin

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install visualstudio2022buildtools -y --params "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.VC.CMake.Project --add Microsoft.VisualStudio.Component.VC.ATL --add Microsoft.VisualStudio.Component.Windows11SDK.22621"
choco install git.install -y --params "'/GitAndUnixToolsOnPath'"
choco install cmake --version=3.31.0 -y
choco install ninja -y
choco install ccache -y
choco install python -y
choco install strawberryperl -y

# https://github.com/shivammathur/setup-php/wiki/Requirements-for-self-hosted-runners
net user $env:USERNAME | findstr "Local Group Memberships"
# Setup Latest Powershell Core using windows Powershell.
Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-powershell.ps1') } -AddToPath"
# Install 7-Zip
choco install -y --force 7zip.install

# runner setup
mkdir C:\runner; cd C:\runner
# Download the latest runner package
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-win-x64-2.328.0.zip -OutFile actions-runner-win-x64-2.328.0.zip
if((Get-FileHash -Path actions-runner-win-x64-2.328.0.zip -Algorithm SHA256).Hash.ToUpper() -ne 'a73ae192b8b2b782e1d90c08923030930b0b96ed394fe56413a073cc6f694877'.ToUpper()){ throw 'Computed checksum did not match' }
# Extract the installer
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.328.0.zip", "$PWD")
