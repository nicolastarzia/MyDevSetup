$packagesNames = @(
    "googlechrome",
    "firefox",
    "sysinternals",
    # "vim",
    "vscode",
    "Microsoft-Hyper-V-All -source windowsFeatures",
    "Microsoft-Windows-Subsystem-Linux -source windowsfeatures",
    "visualstudio2017community --package-parameters=""'--add Microsoft.VisualStudio.Component.Git'""",
    "golang",
    "dotnetcore-sdk",
    "python2",
    "nodejs.install",
    "yarn",
    "docker-for-windows",
    "git.install --params ""/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf""",
    "cmder",
    "firacode",
    "7zip.install",
    "thunderbird",
    "anki",
    "evernote",
    "postman",
    "1password",
    "hugo",
    "gpg4win",
    "Office365ProPlus"
)

foreach ($app in $packagesNames){
    $installCommand = "choco install -y $app"
    Invoke-Expression $installCommand
    Update-SessionEnvironment
}