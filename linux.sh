mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.328.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.328.0.tar.gz
./config.sh --url https://github.com/ROCm --token {TOKEN} --no-default-labels --labels {LABEL}
usermod -a -G sudo "$(id -un)"
echo "%sudo ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo ./svc.sh install root
sudo ./svc.sh start
