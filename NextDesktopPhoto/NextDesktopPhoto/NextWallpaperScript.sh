#!/usr/bin/osascript

#  NextWallpaperScript.sh
#  NextDesktopPhoto
#
#  Created by Stephen Geluso on 10/16/23.
#  

say "hello"

tell application "System Events"
    tell current desktop
        set initInterval to get change interval
        set change interval to initInterval
     end tell
end tell
