//
//  AppDelegate.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import Foundation
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        let apiKey = ProcessInfo.processInfo.environment["MAPS_API_KEY"]
        GMSServices.provideAPIKey(apiKey!)
        return true
    }
}
