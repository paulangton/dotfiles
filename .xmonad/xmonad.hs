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
    xmproc <- spawnPipe "xmobar -d"

    xmonad $ baseConfig {
                terminal = "urxvt"
                , layoutHook = avoidStruts $ layoutHook baseConfig
                , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        , ppOrder               = \(ws:l:t:_)   -> [ws]
                        , ppCurrent             = xmobarColor   colorBlue       colorGrayAlt
                        , ppUrgent              = xmobarColor   colorGreen      colorGrayAlt
                        , ppVisible             = xmobarColor   colorGray       colorGrayAlt
                        , ppHidden              = xmobarColor   colorWhite      colorGrayAlt
                        }
                , modMask = mod4Mask
                , manageHook = manageDocks <+> manageHook baseConfig
                }
                `additionalKeysP` [("M-S-q", kill)
                                     , ("M-<Return>", spawn "urxvt")
                                     , ("M-<Space>", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
                                     , ("M-<F6>", spawn "playerctl skip")
                                     , ("M-<F5>", spawn "playerctl play-pause")
                                     , ("M-<F4>", spawn "playerctl previous")
                                    ]

               

