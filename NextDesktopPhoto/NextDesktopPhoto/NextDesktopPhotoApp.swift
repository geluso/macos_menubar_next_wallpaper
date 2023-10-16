//
//  NextDesktopPhotoApp.swift
//  NextDesktopPhoto
//
//  Created by Stephen Geluso on 10/16/23.
//

import SwiftUI

@main
struct NextDesktopPhotoApp: App {
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            Button("Next Desktop Picture") {
                currentNumber = "1"
                print("pressed 1")
                NSSound.beep()
                
                do {
                    let url1 = URL(fileURLWithPath: "./TriggerNextDesktop.scpt")
                    let url2 = URL(fileURLWithPath: "/Users/geluso/Code/next_desktop/TriggerNextDesktop.scpt")
                    let url3 = URL(fileURLWithPath: "/Users/geluso/Code/next_desktop/NextDesktopPhoto/NextDesktopPhoto/TriggerNextDesktop.scpt")
                    let task = try NSUserScriptTask(url: url1)
                    task.execute(completionHandler: { error in
                        print(error)
                    })
                } catch {
                    print("✖︎ Error while loading the script. \(error)\n")
                    return
                }
            }
            
            Divider()
            
            Button("Quit") {
                print("pressed quit")
                NSApplication.shared.terminate(nil)

            }.keyboardShortcut("q")
        }
    }
}
