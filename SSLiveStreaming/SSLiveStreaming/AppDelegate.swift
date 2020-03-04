//
//  AppDelegate.swift
//  SSLiveStreaming
//
//  Created by Selina on 2020/3/4.
//  Copyright © 2020 Selina. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //创建window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //设置window的rootViewController
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

