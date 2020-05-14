#Introductory Message
Write-Host 'This script downloads and installs the latest versions of Google Chrome, Mozilla Firefox, Winrar and Adobe Reader onto the target system. 
Please allow several minutes for the installation to complete.' 

Write-Host "Press enter to continue with the Download Phase..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

#Hides the Progress Bar of Invoke-WebRequest
$progressPreference = "silentlyContinue"

#Path where the downloads are stored
$download_path = "$env:userprofile\Downloads"

#Downloads the web installer of Google Chrome
$download = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BBC96F9C7-F4FB-F311-C970-BFB67A36A3C8%7D%26lang%3Den%26browser%3D5%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"
Write-Host 'Starting download for the latest web installer of Google Chrome x64...'
Invoke-WebRequest -URi "$download" -OutFile "$download_path\ChromeSetup.exe"
Write-Host 'Download complete.' 

#Downloads the full installer for Mozilla Firefox x64 bit
$download1 = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
Write-Host 'Starting download for the latest installer of Mozilla Firefox x64...'
Invoke-WebRequest -URi "$download1" -OutFile "$download_path\FirefoxLatestFull.exe"
Write-Host 'Download complete.'

#Downloads the full installer for Winrar x64 bit
$download2 = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-590.exe"
Write-Host 'Starting download for the latest installer of Winrar x64...'
Invoke-WebRequest -URi "$download2" -OutFile "$download_path\winrar-x64-590.exe"
Write-Host 'Download complete.'

#Downloads the full installer for Adobe Reader
$download3 = "https://admdownload.adobe.com/bin/live/readerdc_en_xa_cra_install.exe"
Write-Host 'Starting download for the latest installer of Adobe Reader x64...'
Invoke-WebRequest -URi "$download3" -OutFile "$download_path\readerdc_en_xa_cra_install.exe"
Write-Host 'Download complete.'

#Prompts the user to check their Downloads folder after download completion 
Write-Host 'Check your Downloads folder for verification!' 

Write-Host "Press enter to continue with the Installation Phase..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

#Installs Google Chrome onto the target machine. 
Write-Host 'Starting the Google Chrome Web Browser Installer...' 
Start-Process -FilePath "$download_path\ChromeSetup.exe" -Wait

#Installs Firefox onto the target machine.  
Write-Host 'Starting the Mozilla Firefox Web BrowserInstaller...' 
Start-Process -FilePath "$download_path\FirefoxLatestFull.exe" -Wait

#Installs Winrar x64 onto the target machine. 
Write-Host 'Starting Winrar x64 installer...' 
Start-Process -FilePath "$download_path\winrar-x64-590.exe" -Wait

#Installs Adobe Reader onto the target machine. 
Write-Host 'Starting the Adobe Reader installer...' 
Start-Process -FilePath "$download_path\readerdc_en_xa_cra_install.exe" -Wait

#Deletes the downloaded installers after execution
Write Host 'Deleting the downloaded installers...' 
Remove-Item -recurse "$download_path\readerdc_en_xa_cra_install.exe, FirefoxLatestFull.exe, ChromeSetup.exe, readerdc_en_xa_cra_install.exe"
Write Host 'Installers removed. Please check your Downloads folder to verify.'

#Deletes the downloaded installers after execution
Write Host 'Deleting the downloaded installers...' 
Remove-Item "$download_path\readerdc_en_xa_cra_install.exe"
Remove-Item "$download_path\FirefoxLatestFull.exe"
Remove-Item "$download_path\ChromeSetup.exe"
Remove-Item "$download_path\winrar-x64-590.exe"
Write Host 'Installers removed. Please check your Downloads folder to verify.'

#Prevents Powershell from being closed after script execution 
Read-Host -Prompt "Press Enter to exit"