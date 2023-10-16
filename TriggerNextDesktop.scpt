#!/usr/bin/osascript

tell application "System Events"
    tell current desktop
        set initInterval to get change interval
        set change interval to initInterval
     end tell
end tell
