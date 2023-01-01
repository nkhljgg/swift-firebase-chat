//
//  Firebase_ChatApp.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import FirebaseCore
import SwiftUI

@main
struct Firebase_ChatApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
}
