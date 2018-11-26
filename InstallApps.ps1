Disable-UAC


# Get the base URI path from the ScriptToCall value

$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "[x.x] helper script base URI is $helperUri [x.x]" -ForegroundColor Yellow -BackgroundColor Blue

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	Invoke-Expression ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

$computername = "thire" #Star Wars!!!
if ($env:computername -ne $computername) {
	Rename-Computer -NewName $computername
}

Write-Host "[x.x] Installing softwares [x.x]" -ForegroundColor Yellow -BackgroundColor Blue
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "ChocoPackages.ps1";
executeScript "VimConfig.ps1";
executeScript "TodoistConfig.ps1";


Write-Host '[x.x] Starting CleanMgr.exe...[x.x]' -ForegroundColor Yellow -BackgroundColor Blue
Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:1' -WindowStyle Hidden -Wait

Write-Host '[x.x] Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes. [x.x]' -ForegroundColor Yellow -BackgroundColor Blue
Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
