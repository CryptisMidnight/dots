function color ($clr)
	{
	    process { Write-Host $_ -ForegroundColor $clr}
	}
function colorN ($clr2)
	{
	    process { Write-Host $_ -ForegroundColor $clr2 -nonewline}
	}
function upgrade
	{
		Write-Output " Chocolatey checking for upgrades" | color DarkCyan
		choco upgrade all
		Write-Output " Winget is checking its repos" | color DarkMagenta
		winget upgrade --all --verbose-logs
		Write-Output " Scoop is looking for bucket updates and app upgrades" | color DarkYellow
		scoop update
		scoop status 
	}	
function cfgLS ($dth)
	{
		Get-ChildItem -name -Depth $dth | Out-File -FilePath .\listFile.txt
	}
function wipe ($ddl)
	{
		Format $ddl /P:3
	}
function lsf
	{
		Get-ChildItem -force
	}
function Symlink ($link, $real)
	{
		New-Item -ItemType SymbolicLink -Path $link -Target $real
	}
function search ($sear)
	{
		Write-Output " Chocolatey checking for " | colorN DarkCyan
		Write-Output "$sear" | color Magenta
		choco search $sear
		Write-Output " Finding " | colorN DarkMagenta
		Write-Output "$sear" | colorN Magenta
		Write-Output " with Winget" | color DarkMagenta 
		winget search $sear
		Write-Output " Scoop is looking for " | colorN DarkYellow
		Write-Output "$sear" | color Magenta
		scoop search $sear
	}
function prols
	{
		Write-Output " Detected installs (Winget)" | color DarkMagenta
		winget ls
		Write-Output " Chocolatey Installed" | color Cyan
		choco list
		Write-Output " Installed with Scoop" | color DarkYellow
		scoop list
	}
function seq ($var)
	{
		for (;$i -le $var;$i++)
		{
			Write-Output "$i"
		}
		
	}
