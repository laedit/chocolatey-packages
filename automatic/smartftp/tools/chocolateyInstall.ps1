﻿$ErrorActionPreference = 'Stop'

if ([System.Environment]::OSVersion.Version -lt (new-object 'Version' 10, 0, 14393)) {
  $packageName = 'smartftp'
  $errorMessage = 'Your Windows version is not suitable for this package. This package is only for Windows 10 Version 1607 or higher'
  Write-Output $packageName $errorMessage
  throw $errorMessage
}

$packageArgs = @{
  packageName            = 'smartftp'
  fileType               = 'msi'
  url                    = 'https://www.smartftp.com/get/SmartFTP86.msi'
  url64bit               = 'https://www.smartftp.com/get/SmartFTP64.msi'
  checksum               = 'bc8e912d824e860592007a6498f412ec662dea5025a91574667ca4e8d6a0e30f'
  checksum64             = '1b715ae48ce65b6d9f008218cacd042086f9a37f662e277efc9633ab8f1d7b1d'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/quiet'
  validExitCodes         = @(0)
  softwareName           = 'SmartFTP Client'
}
Install-ChocolateyPackage @packageArgs
