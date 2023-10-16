#!/usr/bin/osascript

say "hello"

tell application "System Events"
    tell current desktop
        set initInterval to get change interval
        set change interval to initInterval
     end tell
end tell
