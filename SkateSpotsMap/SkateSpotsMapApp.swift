//
//  SkateSpotsMapApp.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct SkateSpotsMapApp: App {
  @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    init() {
        configureAmplify()
    }
    
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            
            try Amplify.configure()
            print("Successfully configures amplify")
        } catch {
            print("Could not configure amplify", error)
        }
    }
}
