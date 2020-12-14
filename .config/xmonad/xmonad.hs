import XMonad hiding ( (|||) )

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WorkspaceHistory

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad

import XMonad.Layout.IndependentScreens
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Gaps

import XMonad.Actions.FloatKeys
import qualified XMonad.Actions.TreeSelect as TS

import Graphics.X11.ExtraTypes.XF86

import Data.Monoid
import Data.Tree
import Data.Ratio ((%))

import System.Exit
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map as M

import Colors

myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth = 1

myModMask = mod4Mask

myWorkspaces = withScreens 2 ["GEN", "WEB", "COM", "MON", "OBS", "VM", "NSP"]

myNormalBorderColor = color10
myFocusedBorderColor = color12

myTreeNavigation = M.fromList
    [ ((0, xK_Escape), TS.cancel)
    , ((0, xK_Return), TS.select)
    , ((0, xK_space), TS.select)
    , ((0, xK_Up), TS.movePrev)
    , ((0, xK_Down), TS.moveNext)
    , ((0, xK_Left), TS.moveParent)
    , ((0, xK_Right), TS.moveChild)
    , ((0, xK_k), TS.movePrev)
    , ((0, xK_j), TS.moveNext)
    , ((0, xK_h), TS.moveParent)
    , ((0, xK_l), TS.moveChild)
    , ((0, xK_o), TS.moveHistBack)
    , ((0, xK_i), TS.moveHistForward)
    ]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_c), kill)
    , ((modm, xK_space), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    , ((modm, xK_n), refresh)
    , ((modm, xK_j), windows W.focusDown)
    , ((modm, xK_k), windows W.focusUp)
    , ((modm .|. shiftMask, xK_z), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm .|. shiftMask, xK_space), withFocused $ windows . W.sink)
    , ((modm, xK_comma), sendMessage (IncMasterN 1))
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))
    , ((modm, xK_m), sendMessage $ JumpToLayout "Full")
    , ((modm, xK_o), sendMessage $ JumpToLayout "Spiral")
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess)) 
    , ((modm, xK_u), spawn ("dmenu_run -nb '" ++ color0 ++ "' -nf '" ++ color10 ++ "' -sb '" ++ color1 ++ "' -sf '" ++ color7 ++ "'"))
    , ((modm, xK_p), spawn ("passmenu -nb '" ++ color0 ++ "' -nf '" ++ color10 ++ "' -sb '" ++ color1 ++ "' -sf '" ++ color7 ++ "'"))
    , ((modm .|. shiftMask, xK_d), spawn ("flameshot gui"))
    , ((modm .|. shiftMask, xK_s), spawn "betterlockscreen --lock dimblur")
    , ((modm, xK_n), spawn "firefox")
    , ((modm, xK_o), spawn "alacritty --class file_manager -d 25 25 -e ranger")

    --, ((modm,               xK_a     ), withFocused (keysMoveWindowTo (512,384) (1%2,1%2)))
    --, ((modm,               xK_z     ), withFocused (keysResizeWindow (-10,-10) (1,1)))
    --, ((modm,               xK_x     ), withFocused (keysResizeWindow (10,10) (1,1)))

    --, ((modm,               xK_s     ), withFocused (keysMoveWindow (-10,0)))
    --, ((modm,               xK_d     ), withFocused (keysMoveWindow (0,-10)))
    --, ((modm,               xK_f     ), withFocused (keysMoveWindow (0,10)))
    --, ((modm,               xK_g     ), withFocused (keysMoveWindow (10,0)))

    , ((modm, xK_t), namedScratchpadAction scratchpads "alacritty")
    , ((modm, xK_i), namedScratchpadAction scratchpads "htop")
    , ((modm, xK_b), namedScratchpadAction scratchpads "Spotify")
    , ((modm, xK_v), namedScratchpadAction scratchpads "discord")
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask, xK_y), spawn "wal -i ~/proj/sysconf/wallpapers/wallpaper")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 5%+ unmute")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 5%- unmute")
    , ((0, xF86XK_AudioMute), spawn "amixer -q set Master toggle")
    , ((0, xF86XK_AudioPlay), spawn "playerctl play-pause")
    , ((0, xF86XK_AudioPrev), spawn "playerctl previous")
    , ((0, xF86XK_AudioNext), spawn "playerctl next")
    , ((0, xF86XK_KbdBrightnessUp), spawn "xbacklight -inc 5%")
    , ((0, xF86XK_KbdBrightnessDown), spawn "xbacklight -dec 5%")
    ]
    ++

    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

myLayout = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    ThreeColMid 1 (3/100) (1/2) |||
    spiral (6/7) |||
    Full)

myManageHook = namedScratchpadManageHook scratchpads <+> (composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "Steam" --> doFloat
    , className =? "scratchpad" --> doFloat
    , className =? "file_manager" --> doFloat
    , className =? "Spotify" --> doFloat
    , className =? "discord" --> doFloat
    , resource =? "desktop_window" --> doIgnore ]) 

scratchpads :: [NamedScratchpad]
scratchpads = [
    NS "htop" "alacritty --class scratchpad --title Htop -e htop" (title =? "Htop") 
        (customFloating $ W.RationalRect (0) (1/3) (1) (2/3)),
    NS "Spotify" "spotify" (className =? "Spotify") 
        (customFloating $ W.RationalRect (0) (3/10) (1) (7/10)),
    NS "discord" "discord --no-sandbox --class discord" (className =? "discord") 
        (customFloating $ W.RationalRect (0) (3/10) (1) (7/10)),
    NS "alacritty" "alacritty --class scratchpad --title Terminal-Scratchpad"  (title =? "Terminal-Scratchpad") 
        (customFloating $ W.RationalRect (0) (1/3) (1) (2/3))
 ]

main = do
    xmproc0 <- spawnPipe "xmobar --screen=0 ~/.config/xmonad/xmobar-internal.hs"
    xmproc1 <- spawnPipe "xmobar --screen=1 ~/.config/xmonad/xmobar-external.hs"
    xmonad $ ewmh defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook <+> manageDocks,
        handleEventHook    = docksEventHook,
        logHook            = dynamicLogWithPP $ xmobarPP {
                             ppOutput = hPutStrLn xmproc0
                           --, ppCurrent = xmobarColor color12 "" . wrap "[" "]"
                           --, ppVisible = xmobarColor color10 "" . wrap "(" ")"
                           --, ppUrgent = xmobarColor color11 "" . wrap "{" "}"
                           --, ppTitle = xmobarColor color14 "" . shorten 100
                           --, ppSep = "     "
                           },
        startupHook        = setWMName "LG3D"
    }
