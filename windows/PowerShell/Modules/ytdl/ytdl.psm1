function ytSD ($lnk1) 
	{
		yt-dlp -o "D:\Videos\Downloaded\%(title)s-%(id)s.%(ext)s" $lnk1
	}
function ytAD ($op, $lnk1) 
	{
		$fop = "-f$op"
		yt-dlp $fop -o "D:\Videos\Downloaded\%(title)s-%(id)s.%(ext)s" $lnk1
	}
function ytLS ($lnk1) 
	{
		yt-dlp -F $lnk1
	}
function plyr ($strm)
	{
		mpv --hwdec --no-border --loop-playlist --autofit=940x550 --shuffle --volume=35 $strm
	}
function stream ($strm)
	{
		streamlink -p "mpv --hwdec --no-border --loop-playlist --autofit=940x550 --shuffle --volume=35" $strm best
	}
function ytMusic ($lnkA) 
	{
		yt-dlp -f ba -o "D:\Music\Downloaded\%(title)s.%(ext)s" $lnkA 
	}
function mkmp3 ($alb1) 
	{
		mkdir ../$alb1
		ls -Filter *.webm | ForEach-Object {
			ffmpeg -i $_.FullName -i "$($alb1).jpg" -i "$($alb1).txt" -map_metadata 2 -map 0:a -map 1:0 -c:1 copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" -metadata title="$($_.Basename)" -f mp3 ../$alb1/"$($_.Basename).mp3"
			}
		$tt = 'Choose' | color White
		$qn = 'What do you want to do with the files?' | color Magenta
		$cc = '&Backup', '&Delete', '&Nothing'
		$dec = $Host.UI.PromptForChoice($tt, $qn, $cc, 2)
		if ($dec -eq 0) {
		    Write-Output 'You have choosen PackRat.' | color Green
			mkdir ../bak/$alb1
			mv ./* ../bak/$alb1/
		} elseif ($dec -eq 1) {
		    Write-Output 'You have choosen Destruction.' | color DarkRed
			rm *
		} else {
			Write-Output 'You have choosen Sloth.' | color Cyan
		}
	}