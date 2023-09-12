set gameDir="D:/Games/Steam/steamapps/common/Arma 3/Arma3_x64.exe"
set mission="C:\Users\skull\OneDrive\Documents\Arma 3 - Other Profiles\Dart\missions\CWR%%20Test.VR\mission.sqm"
set mods="-mod=!Workshop/@CBA_A3;!Workshop/@ace;Local Mods\A3-ChatWheel-Redux"
set profile=-name="Dart"

%gameDir% %mission% %mods% -skipIntro -noSplash -cpuCount=6 -exThreads=7 -enableHT -malloc=system -hugePages -maxmem=20000 -maxvram=8192 -noPause -noPauseAudio -showScriptErrors