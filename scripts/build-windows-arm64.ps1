$base_url = "https://dl.cryptlex.com/downloads"
$lexactivator_version ="v3.30.3"

New-Item -Path ".\tmpArm64\windows" -ItemType Directory
$url = "$base_url/$lexactivator_version/LexActivator-Win.zip"
Write-Host "Downloading LexActivator library ..."
Write-Host $url
$output = ".\tmpArm64\windows\LexActivator-Win.zip"
(New-Object System.Net.WebClient).DownloadFile($url, $output)

Expand-Archive $output -DestinationPath ".\tmpArm64\windows\LexActivator-Win"

Copy-Item -Path ".\tmpArm64\windows\LexActivator-Win\libss\vc17\arm64\LexActivator.lib" -Destination ".\"
npm i
node-gyp rebuild 

Copy-Item -Path ".\build\Release\lexactivator.node" -Destination ".\lib\bindings\windows\arm64\lexactivator.node"
Copy-Item -Path ".\tmpArm64\windows\LexActivator-Win\libs\vc17\arm64\LexActivator.dll" -Destination ".\lib\bindings\windows\arm64\LexActivator.dll"
s