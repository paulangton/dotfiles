import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
import qualified Data.Map as M

baseConfig = desktopConfig

    
main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ baseConfig {
                terminal = "urxvt"
                , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
                , modMask = mod4Mask
                }
                `additionalKeysP` [("M-S-q", kill)
             , ("M-<Return>", spawn "urxvt")
             , ("M-<Space>", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
            ]

               

