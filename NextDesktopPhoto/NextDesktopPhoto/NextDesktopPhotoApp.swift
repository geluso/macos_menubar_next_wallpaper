//
//  NextDesktopPhotoApp.swift
//  NextDesktopPhoto
//
//  Created by Stephen Geluso on 10/16/23.
//

import SwiftUI

@main
struct NextDesktopPhotoApp: App {
    @State var title: String = "Next Wallpaper"
    
    var body: some Scene {
        MenuBarExtra(title, image: "LogoInverted")  {
            Button("Next wallpaper") {
                runFullScript()
            }
            
            Divider()
            
            Button("Quit") {
                print("pressed quit")
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
    
    func runFullScript() {
        Thread {
            let src = """
                tell application "System Events"
                    tell current desktop
                        set initInterval to get change interval
                        set change interval to initInterval
                    end tell
                end tell
            """
            
            if let script = NSAppleScript(source: src) {
                var error: NSDictionary? = nil
                script.executeAndReturnError(&error)
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
        .start()
    }
}
