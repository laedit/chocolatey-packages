﻿$ErrorActionPreference = 'Stop'
$toolsPath = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
. "$toolsPath\helpers.ps1"

$pp = Get-PackageParameters

$parameters += if ($pp.NoDesktopShortcut) { " /desktopshortcut=0"; Write-Host "Desktop shortcut won't be created" }
$parameters += if ($pp.NoTaskbarShortcut) { " /pintotaskbar=0"; Write-Host "Opera won't be pinned to taskbar" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://get.geo.opera.com/pub/opera/desktop/66.0.3515.36/win/Opera_66.0.3515.36_Setup.exe'
  url64          = 'https://get.geo.opera.com/pub/opera/desktop/66.0.3515.36/win/Opera_66.0.3515.36_Setup_x64.exe'
  checksum       = '5bbeec157aaf2b80349916076b0e0e617fa4cb791f5c2328183651249ec341da'
  checksum64     = '95f9f7ec4d0d59e8e253d80ac649f0585ce165208480e3987759b11e0e06468c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/install /silent /launchopera=0 /setdefaultbrowser=0 /allusers=1' + $parameters
  validExitCodes = @(0)
}

$version = '66.0.3515.36'
if (!$Env:ChocolateyForce -and (IsVersionAlreadyInstalled $version)) {
  Write-Output "Opera $version is already installed. Skipping download and installation."
}
else {
  Install-ChocolateyPackage @packageArgs
}
