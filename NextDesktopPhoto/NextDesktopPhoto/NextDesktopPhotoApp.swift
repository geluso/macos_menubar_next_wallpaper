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
                let path = Bundle.main.path(forResource: "TriggerNextDesktop", ofType: "scpt")
                runScript(filename: path!)
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
}
