/*
Copyright (C) 2016 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The application delegate.
*/

import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let healthStore: HKHealthStore = HKHealthStore()
    
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        healthStore.handleAuthorizationForExtension { success, error in
            if let error = error, !success {
                print("You didn't allow HealthKit to access these read/write data types. In your app, try to handle this error gracefully when a user decides not to provide access. The error was: \(error.localizedDescription). If you're using a simulator, try it on a device.")
            }
        }
    }
}

