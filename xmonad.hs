import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmonad $ defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderwidth = myBorderWidth
    }

myTerminal    = "gnome-terminal"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 3
