$packagesNames = @(
    "googlechrome",
    "firefox",
    "sysinternals",
    "vim",
    "vscode",
    "Microsoft-Hyper-V-All -source windowsFeatures",
    "Microsoft-Windows-Subsystem-Linux -source windowsfeatures",
    "DotNet4.5.2",
    "DotNet4.6.1",
    "DotNet4.6.2",
    "ilspy",
    "logparser",
    "visualstudio2017community --package-parameters=""'--add Microsoft.VisualStudio.Component.Git'""",
    "cmake.install",
    "golang",
    "ruby",
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
    "rambox",
    "anki",
    "evernote",
    "postman",
    "1password",
    "hugo",
    "logparser",
    "gpg4win",
    "Office365ProPlus"
)

foreach ($app in $packagesNames){
    $installCommand = "choco install -y $app"
    Invoke-Expression $installCommand
    Update-SessionEnvironment
}
