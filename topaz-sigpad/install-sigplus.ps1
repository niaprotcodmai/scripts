#powershell script to install topaz signature pad software
#configured for Model T-LBK462-HSB-R

#Check to make sure the dependancy file folder is located in the C:\ root directory
$folder = 'C:\TopazSignaturePad'

if (Test-Path -Path $folder) {
    Write-Host "Dependancy file exists. Continuing..."

    #create SigPlus folder in Windows folder
    Write-Host "Creating SigPlus folder in Windows directory..."
    New-Item -path 'C:\Windows\SigPlus' -ItemType Directory

    #move dlls into System32 folder
    Write-Host "Copying .dll files to System folder..."
    Copy-Item 'C:\TopazSignaturePad\mfc42.dll' 'C:\Windows\System32'
    Copy-Item 'C:\TopazSignaturePad\msvcrt.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\ole32.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\oleaut32.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\comdlg32.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\comctl32.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\oledlg.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\hid.dll' 'C:\Windows\System32\'
    Copy-Item 'C:\TopazSignaturePad\olepro32.dll' 'C:\Windows\SysWOW64\'

    #move .ocx and topazlicense.txt into SigPlus folder
    Write-Host "Copying .ocx file and license to SigPlus directory..."
    Copy-Item 'C:\TopazSignaturePad\SigPlus.ocx' 'C:\Windows\SigPlus\'
    Copy-Item 'C:\TopazSignaturePad\SigSign.ocx' 'C:\Windows\SigPlus\'
    Copy-Item 'C:\TopazSignaturePad\TopazLicense.txt' 'C:\Windows\SigPlus\'

    #register .ocx files
    Write-Host "Registering .ocx files..."
    regsvr32 C:\Windows\SigPlus\SigPlus.ocx /s
    regsvr32 C:\Windows\SigPlus\SigSign.ocx /s

    #move .ini file into Windows folder
    Write-Host "Copying .ini file to Windows directory..."
    Copy-Item 'C:\TopazSignaturePad\SigPlus.ini' 'C:\Windows\'

    #move .sys files into drivers folder
    Write-Host "Copying .sys files to drivers directory..."
    Copy-Item 'C:\TopazSignaturePad\hidclass.sys' 'C:\Windows\System32\drivers\'
    Copy-Item 'C:\TopazSignaturePad\hidparse.sys' 'C:\Windows\System32\drivers\'
    Copy-Item 'C:\TopazSignaturePad\hidusb.sys' 'C:\Windows\System32\drivers\'

    #move test .exe into SigPlus folder
    Write-Host "Copying DemoOCX program to SigPlus directory..."
    Copy-Item 'C:\TopazSignaturePad\DemoOCX.exe' 'C:\Windows\SigPlus\'

    #cleanup installation files
    Remove-Item 'C:\TopazSignaturePad\' -Recurse
    Remove-Item C:\topazsignaturepad.zip

    Write-Host "Installation is Complete!"
    }
 else {
     Write-Host "The dependancy folder [$folder] does not exist."
     exit 1
 }
