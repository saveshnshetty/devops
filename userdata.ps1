write-host "running init script"
if(!(test-path -Path "c:\temp"))
  {    
    New-Item -ItemType directory -Path "C:\temp"
    write-host "created temp directory"
  }
$client = new-object System.Net.WebClient
$client.DownloadFile("https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.0.0-x64.msi","c:\temp\puppet.msi")
cd "c:\temp"
pwd
echo "`n13.93.159.60 puppet"  | Out-File -FilePath "C:\Windows\System32\drivers\etc\hosts" -Append -Encoding ascii
msiexec /qn /norestart /i "c:\temp\puppet.msi" 
if(test-path -path "C:\ProgramData\PuppetLabs\facter\facts.d")
  {
    echo "`nconsolename : dev-it-mactores-media" | Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii
	echo "`nbu : it" | Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii
	echo "`nenv : dev" | Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii			
	echo "`ncompany_name : mactores" | Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii
	echo "`napplication : videotouch" |  Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii
	echo "`nservertype : media" |  Out-File -FilePath "C:\ProgramData\PuppetLabs\facter\facts.d\facts.yaml" -Append -Encoding ascii
 }


