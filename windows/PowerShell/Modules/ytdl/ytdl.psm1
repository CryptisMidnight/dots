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
		mpv --hwdec --no-border --loop-playlist --autofit=940x550 --volume=35 $strm
	}
function stream ($strm)
	{
		streamlink -p "mpv --hwdec --no-border --loop-playlist --autofit=940x550 --volume=35" $strm best
	}
