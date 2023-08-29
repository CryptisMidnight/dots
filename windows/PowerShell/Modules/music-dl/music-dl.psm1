function color ($clr)
	{
	    process { Write-Host $_ -ForegroundColor $clr}
	}
function colorN ($clr)
	{
	    process { Write-Host $_ -ForegroundColor $clr -nonewline}
	}
function musix ()
{
    $dir = 'D:\Music\Downloaded' # Change this to your default folder you want music to be download to.

    Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    Write-Output "| " | colorN DarkMagenta; Write-Output "Input an address like " | colorN White; Write-Output "https://music.youtube.com/watch?v=" | colorN Darkcyan; Write-Output "TggM0NGaICg" | colorN Magenta; Write-Output  " |" | color DarkMagenta
    Write-Output "| " | colorN DarkMagenta; Write-Output  "or just the ID " | colorN White; Write-Output "OLAK5uy_nL1fslBidCyEiu_ZDSa0TgD5qa36Sa_F8" | colorN Magenta; Write-Output "            |" | color DarkMagenta;
    Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $lnk = Read-Host -Prompt 'Link/ID'

    $top = " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $bd1 = "| " | colorN DarkMagenta; Write-Output "Would you like to convert you download(s) to .mp3 now?" | colorN White; Write-Output "              |" | color DarkMagenta; Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $yn = '&Yes', '&No'
    $ch1 = $Host.UI.PromptForChoice($top, $bd1, $yn, 0)
    if ($ch1 -eq 1){
        yt-dlp --parse-metadata "playlist_index:%(track_number)s" --add-metadata -o "$dir\%(title)s.%(ext)s" $lnk
        Write-Output 'Your music is downloaded'{return; break}
    }
    else{}

    $top = " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $bd2 = "| " | colorN DarkMagenta; Write-Output "Use the default cover/image art or supply my own? " | colorN White; Write-Output "                  |" | color DarkMagenta; Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $ds = '&Default', '&Supply'
    $ch2 = $Host.UI.PromptForChoice($top, $bd2, $ds, 0)
    if ($ch2 -eq 1){
        Write-Host "`n"
        Write-Output 'Please put an image in the download folder, it must be a .jpg' | color DarkRed
        Write-Output 'do this before continuing, as this will break this function' | color DarkRed
        Write-Host "`n"
    }
    else{}
    
    Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    Write-Output "| " | colorN DarkMagenta; Write-Output "What would you like the Album or Folder called?" | colorN White; Write-Output "                     |" | color DarkMagenta
    Write-Output " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
    $albm = Read-Host -Prompt 'Album/Folder Name'

    Write-Host "`n"
    Write-Output 'Press any key to start converting' | color Cyan
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

    cd $dir
    yt-dlp --parse-metadata "playlist_index:%(track_number)s" --add-metadata -o "$dir\%(title)s.%(ext)s" $lnk
    if ($ch2 -eq 1){
        mv *.jpg "$($albm).jpg"
    }
    else{
        ForEach ($pic in (gci *.webm))
        {
            ffmpeg -y -i $pic.Name -vframes 1 -filter:v scale=-2:512  "$($albm).jpg"
        }
    }
	mkdir ../$albm
	ForEach ($sng in (gci *.webm))
    {
		ffmpeg -i $sng.Name -i "$($albm).jpg" -map 0:a -map 1:0 -c:1 copy -id3v2_version 3 -metadata comment="" -metadata synopsis="" -metadata description="" -metadata purl="" -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" ../$albm/"$($sng.Basename).mp3" 
	}
	$tt = " --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- ~~~ --- " | color DarkMagenta
	$qn = 'What do you want to do with the files?' | color Magenta
	$cc = '&Backup', '&Delete', '&Nothing'
	$dec = $Host.UI.PromptForChoice($tt, $qn, $cc, 2)
	if ($dec -eq 0) {
	    Write-Output 'You have choosen Greed.' | color Green
		mkdir ../bak/$albm
		mv ./* ../bak/$albm/
	} elseif ($dec -eq 1) {
	    Write-Output 'You have choosen Wrath.' | color DarkRed
		rm *
	} else {
		Write-Output 'You have choosen Sloth.' | color Cyan
	}

}