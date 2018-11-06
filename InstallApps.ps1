#Exec windows-dev-toolbox / winfull + web

function Write-Regedit { # Thanks Scripting Guy
    param (
        [string]$registryPath,
        [string]$Name,
        [string]$value
    )
    IF((Test-Path $registryPath))
    {
        New-ItemProperty -Path $registryPath -Name $name -Value $value `
        -PropertyType DWORD -Force | Out-Null}
}

$packagesNames = @(
    "gpg4win",
    "sysinternals",
    "thunderbird",
    "vim",
    "golang",
    "evernote",
    "postman",
    "hugo",
    "1password",
    "firacode",
    "anki",
    "python2",
    "git.install --params ""/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf""",
    "cmder",
    "dotnetcore-sdk",
    "nodejs.install"
)

foreach ($app in $packagesNames){
    $installCommand = "choco install -y $app"
    Invoke-Expression $installCommand
}


#Clear old stuffs (desktop shortcuts, and cleanmgr)

Remove-Item ~/Desktop/*
Write-Regedit "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarSmallIcons" "1" #Small icons on taskbar
Write-Regedit "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" "PeopleBand" "0" #Remove people from taskbar


Write-Host 'Starting CleanMgr.exe...'
Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:1' -WindowStyle Hidden -Wait

Write-Host 'Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes.'
Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process

