# CI Runner Setup

## Windows

(in admin powershell)

- Open powershell with admin
- Run `Set-ExecutionPolicy RemoteSigned`
- Open notepad as admin, save contents of `windows.ps1` to `C:\`
- Run `windows.ps1`
- Make sure `C:\Program Files\Git\bin` and `C:\Program Files\7-Zip` are added to your path
- Restart the terminal and run `pip install pyyaml`
- Run GitHub set up steps
  - `./config.cmd --url https://github.com/ROCm --token {TOKEN} --windowslogonaccount --windowslogonpassword --no-default-labels --labels {LABEL}`
  - Make sure to allow security access to group in config step
- Run `Stop-Service "actions.runner.*"`
- <b>Make sure to stop the service, run the below command</b>
- In CMD, run `powershell "(Get-Service actions.runner.*).name"`, then `sc config "NAME_OF_YOUR_SERVICE" obj= "NT AUTHORITY\SYSTEM" type= own`
- After, restart the service as admin `Start-Service "actions.runner.*"`
- You can confirm all works with `Get-Service "actions.runner.*"`
