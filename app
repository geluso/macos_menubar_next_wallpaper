//
//  TriggerNextDesktopApp.swift
//  TriggerNextDesktop
//
//  Created by Stephen Geluso on 10/16/23.
//

import os
import SwiftUI

@main
struct TriggerNextDesktopApp: App {
    let logger = Logger()
    
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            Button("Next Desktop Picture") {
                currentNumber = "1"
                logger.log("pressed 1")
            }
            
            Divider()
            
            Button("Quit") {
                logger.log("pressed quit")
                NSApplication.shared.terminate(nil)

            }.keyboardShortcut("q")
        }
    }
}

