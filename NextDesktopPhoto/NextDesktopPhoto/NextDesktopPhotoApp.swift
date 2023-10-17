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
    
    let path = "/Users/geluso/Library/Application Scripts/-tephen.com.NextDesktopPhoto/TriggerNextDesktop.scpt"
    
    var body: some Scene {
        //MenuBarExtra(title, systemImage: "photo") {
        MenuBarExtra(title, image: "LogoInverted")  {
            Button("Next Wallpaper (hard-coded)") {
                runScript(filename: path)
            }
            
            Button("Next Wallpaper (bundle)") {
                let path = Bundle.main.path(forResource: "NextWallpaperScript", ofType: "scpt")
                runScript(filename: path!)
            }
            
            Button("NSAppleScript('say hello')") {
                runAppleScript()
            }
            
            Divider()
            
            Button("Quit") {
                print("pressed quit")
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
    
    func runScript(filename: String) {
        Thread {
            do {
                let url = URL(fileURLWithPath: filename)
                let task = try NSUserScriptTask(url: url)
                task.execute(completionHandler: { error in
                    print(error)
                })
            } catch {
                print("Error while loading the script. \(error)\n")
            }
        }
        .start()
    }
    
    func runAppleScript() {
        Thread {
            let src = "tell application \"System Events\" \n    display dialog \"Hello from AppleScript!\" \nend tell "
            print(src)
            if let script = NSAppleScript(source: src) {
                //var error: NSDictionary? = nil
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
