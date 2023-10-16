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
            Button("./TriggerNextDesktop.scpt") {
                let path = "./TriggerNextDesktop.scpt"
                runScript(filename: path)
            }
            
            Button("/Users/geluso/Code/next_desktop/TriggerNextDesktop.scpt") {
                let path = "/Users/geluso/Code/next_desktop/TriggerNextDesktop.scpt"
                runScript(filename: path)
            }
            
            Button("/Users/geluso/Code/next_desktop/NextDesktopPhoto/NextDesktopPhoto/TriggerNextDesktop.scpt") {
                let path = "/Users/geluso/Code/next_desktop/NextDesktopPhoto/NextDesktopPhoto/TriggerNextDesktop.scpt"
                runScript(filename: path)
            }
            
            Button("Bundle.main.path(forResouce: 'TriggerNextDesktop', ofType: 'scpt'") {
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
}
