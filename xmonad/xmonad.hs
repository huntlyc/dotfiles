import System.IO
import System.Exit

import Graphics.X11.ExtraTypes.XF86

import XMonad
import XMonad.Actions.WorkspaceNames
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.WorkspaceCompare


import qualified Data.Map as M
import qualified XMonad.StackSet as W

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,               xK_q),      restart "xmonad" True)
    , ((modMask .|. shiftMask, xK_q),      io (exitWith ExitSuccess))   
    , ((modMask,               xK_Return), spawn $XMonad.terminal conf)   
    , ((modMask,               xK_p),      spawn "rofi -show run ")
    , ((modMask .|. shiftMask, xK_space),  kill)
    , ((modMask,               xK_t),      sendMessage NextLayout)
    , ((modMask,               xK_j),      refresh)
    , ((modMask,               xK_j),      windows W.focusDown)
    , ((modMask,               xK_k),      windows W.focusUp)
    , ((modMask .|. shiftMask, xK_j),      windows W.swapDown)
    , ((modMask .|. shiftMask, xK_k),      windows W.swapUp)
    , ((modMask,               xK_h),      sendMessage Shrink)
    , ((modMask,               xK_l),      sendMessage Expand)
    , ((modMask,               xK_b),      sendMessage ToggleStruts)
    , ((0, xF86XK_PowerDown),              spawn "sudo pm-suspend")
    , ((0, xF86XK_AudioRaiseVolume),       spawn "amixer -D pulse sset Master 10%+")
    , ((0, xF86XK_AudioLowerVolume),       spawn "amixer -D pulse sset Master 10%-")
    , ((0, xF86XK_AudioMute),              spawn "amixer -D pulse sset Master toggle")
    , ((0, xF86XK_MonBrightnessUp),        spawn "brightnessctl set +10%")
    , ((0, xF86XK_MonBrightnessDown),      spawn "brightnessctl set 10%-")
    ]
    ++
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myModMask = mod1Mask

myTerminal = "kitty"


main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ docks def { 
     modMask = myModMask
    ,terminal = myTerminal
    ,normalBorderColor = "#8f97b7"
    ,focusedBorderColor = "#a6da95"
    ,keys = myKeys
    ,workspaces = map show [1..5]
    ,layoutHook = avoidStruts $ layoutHook def
    , manageHook = composeAll
                        [ isFullscreen --> doFullFloat
                        , manageHook def
                        ]
    ,logHook = workspaceNamesPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = id
        }
        >>= dynamicLogWithPP
    }
