//
//  discoverRdApp.swift
//  discoverRd
//
//  Created by Benderson Phanor on 28/6/23.
//

import SwiftUI

@main
struct discoverRdApp: App {
    var body: some Scene {
        WindowGroup {
            
            if UserDefaults.standard.bool(forKey: "IS_LOGIN"){
                ContentView()
            }else{
                Login()
            }
            
        }
    }
}
