//
//  AppDelegate.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import Foundation
import GoogleMaps
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        // Retrieving API key
        if let filePath = Bundle.main.path(forResource: "contents", ofType: "txt") {
            do {
                print("Successfully retrieved apiKey from file")
                let apiKey = try String(contentsOfFile: filePath)
                GMSServices.provideAPIKey(apiKey)
            } catch {
                print(error)
            }
        } else {
            print("apiKey was not able to be read from file")
        }
        
        // Firebase
        FirebaseApp.configure()
        
        return true
    } 
}
