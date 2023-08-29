#Imports
# Import-Module posh-git
Import-Module Terminal-Icons
Import-Module sysFun
Import-Module ytdl
Import-Module music-dl

#functions/aliases
$prompt = ""
function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($prompt)
}

#autocompletions
Import-Module scoop-completion
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)
		[Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
	    	$Local:word = $wordToComplete.Replace('"', '""')
	        $Local:ast = $commandAst.ToString().Replace('"', '""')
	        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
	        	[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
	}
}
Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force

#other
Set-PSReadLineOption -PredictionSource History
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -Colors @{ InlinePrediction = 'blue'}

$ENV:STARSHIP_CONFIG = "D:\Documents\PowerShell\starship.toml"
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
