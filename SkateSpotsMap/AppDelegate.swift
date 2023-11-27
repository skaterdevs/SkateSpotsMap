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
        let apiData = Bundle.main.path(forResource: "contents", ofType: "txt")
        if let apiKey = apiData {
            print("Successfully retrieved apiKey from file")
            GMSServices.provideAPIKey(apiKey)
        } else {
            print("apiKey was not able to be read from file")
        }
        
        // Firebase
        FirebaseApp.configure()
        
        return true
    } 
}
