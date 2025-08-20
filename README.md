# CI Runner Setup

## Windows

(in admin powershell)

- Open powershell with admin
- Run `Set-ExecutionPolicy RemoteSigned`
- Open notepad as admin, save contents of `windows.ps1` to `C:\`
- Run `windows.ps1`
- Make sure `bash` is added to Path, like `C:\Program Files\Git\bin`
- Run GitHub set up steps
  - `./config.cmd --url https://github.com/ROCm --token {TOKEN} --windowslogonaccount --windowslogonpassword --no-default-labels --labels {LABEL}`
  - Make sure to allow security access to group in config step
- Run this: https://docs.github.com/en/actions/how-tos/manage-runners/self-hosted-runners/configure-the-application?platform=windows to start service
- In CMD, run `powershell "(Get-Service actions.runner.*).name"`, then `sc config "NAME_OF_YOUR_SERVICE" obj= "NT AUTHORITY\SYSTEM" type= own`
