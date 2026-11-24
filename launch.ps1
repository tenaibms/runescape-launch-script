##############
# CONFIG HERE#
##############
$runelite_path = "C:\\Users\\$env:USERNAME\\AppData\\Local\\RuneLite\\RuneLite.exe"
$rs3_path = "C:\\Program Files (x86)\\Jagex Launcher\\Games\\RuneScape\\RuneScape.exe"

###########################
# Don't touch below this!!#
###########################

# https://stackoverflow.com/a/28237896
Function pause ($message)
{
    # Check if running Powershell ISE
    if ($psISE)
    {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show("$message")
    }
    else
    {
        Write-Host "$message" -ForegroundColor Yellow
        $x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

try {
	if (-not (Test-Path ".\sessionid.txt")) {
	        throw "sessionid.txt not found"
    }
	
	$env:JX_SESSION_ID = Get-Content -Path ".\sessionid.txt"
} catch {
	pause("You need to create a file called sessionid.txt and paste your session id into it. See the readme ( ^._.^)")
	exit
}

Get-ChildItem -Path ".\OSRS" -Filter *.properties -File | ForEach-Object {
    $config = Get-Content $_.FullName -Raw | ConvertFrom-StringData

    $env:JX_CHARACTER_ID = $config.JX_CHARACTER_ID
    $env:JX_DISPLAY_NAME = $config.JX_DISPLAY_NAME
	
	try {
		cmd.exe /c start $runelite_path
		
		if ($LASTEXITCODE -ne 0) {
			throw "cmd.exe exited with code $LASTEXITCODE"
		}
	} catch {
		pause("Your RuneLite path may be wrong, please check the script.")
		exit
	}
}

Get-ChildItem -Path ".\RS3" -Filter *.properties -File | ForEach-Object {
    $config = Get-Content $_.FullName -Raw | ConvertFrom-StringData

    $env:JX_CHARACTER_ID = $config.JX_CHARACTER_ID
    $env:JX_DISPLAY_NAME = $config.JX_DISPLAY_NAME
	
	try {
		Start-Process $rs3_path
	} catch {
		pause("Your RS3 path may be wrong, please check the script.")
		exit
	}
}

exit