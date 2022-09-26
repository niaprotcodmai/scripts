#powershell script to remove mock data from PCs before live deployment

#check to see if any mock data is on the PC
$folder = 'C:\data-test'

if (Test-Path -Path $folder) {
    Write-Host "Mock data exists. Continuing..."
    }


 else {
     Write-Host "This PC does not contain any mock data."
     exit 1
 }