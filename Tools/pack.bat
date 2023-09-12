set builder="D:/Games/Steam/steamapps/common/Arma 3 Tools/AddonBuilder/AddonBuilder.exe"
set source="/Coding/GitHub Repos/A3-ChatWheel-Redux/Addons"
set destination="D:/Games/Steam/steamapps/common/Arma 3/Local Mods/A3-ChatWheel-Redux/addons"
set include="C:\Coding\GitHub Repos\A3-ChatWheel-Redux\Addons\Tools\addon_includes.txt"
set binarize="D:\Games\Steam\steamapps\common\Arma 3 Tools\Binarize\binarize.exe"

%builder% %source%/ChatWheelRedux %destination% -include=%include% -binarize=%binarize%