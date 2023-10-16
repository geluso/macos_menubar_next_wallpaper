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
    
    let path1 = "./TriggerNextDesktop.scpt"
    let path2 = "/Users/geluso/Code/next_desktop/TriggerNextDesktop.scpt"
    let path3 = "/Users/geluso/Code/next_desktop/NextDesktopPhoto/NextDesktopPhoto/TriggerNextDesktop.scpt"
    let path4 = "/Users/geluso/Library/Application Scripts/-tephen.com.NextDesktopPhoto/TriggerNextDesktop.scpt"
    
    var body: some Scene {
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            Button(path1) {
                runScript(filename: path1)
            }
            
            Button(path2) {
                runScript(filename: path2)
            }
            
            Button(path3) {
                runScript(filename: path3)
            }
            
            Button(path4) {
                runScript(filename: path4)
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
