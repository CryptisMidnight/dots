# MPV settings and configs 

#### List of files and directories 
      fonts
      icons
      script-opts
      scripts
      shader-input
      shaders
      mpv.conf
      README.md

move files and folders into the config folder => Windows: `%AppData%\mpv\` or for a Scoop install `%USERPROFILE%\scoop\persist\mpv-git\portable_config\` Linux and Mac `~/.config/mpv`
The main settings is mpv.conf and for UI color changes fine settings mid.conf located in script-opts. Once Folders and files are moved into the config directory you will need to move and rename one of the 2 shader-input files. If you have a upper GPU (GTX 1080, RTX 2070, RTX 3060, RX 590, Vega 56, 5700XT, 6600XT) then use the inputHQ.conf, if you have a lower GPU (GTX 980, GTX 1060, RX 570) use inputLW.conf
Move the input file into the main config folder with the mpv.conf, then rename it input.conf
If you have issues with the shaders then please visit [Anime4K Shader pack](https://github.com/bloc97/Anime4K)
