//
//  AppDelegate.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 24.07.19.
//  Copyright © 2019 Eric Bottinelli. All rights reserved.
//

import UIKit
import RevealingSplashView
import Firebase

let heartAttackNotificationName = Notification.Name("heartAttack")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Splashscreen iniziale
    let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "Logo365.png"), iconInitialSize: CGSize(width: 123, height: 123), backgroundImage: #imageLiteral(resourceName: "BackgroundColor.png"))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow() //Creiamo la finestra poichè non c'è il file main.storyboard
        window?.makeKeyAndVisible()
        
        //Porta al "SignIn View Controller" presente nel file "Start.storyboard"
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: "Start", bundle: nil)
        let viewcontroller : UIViewController = mainView.instantiateViewController(withIdentifier: "SignIn") as UIViewController
        self.window!.rootViewController = viewcontroller
        
        /* --- Vecchio codice ---
        let vc = SignInViewController() //Lo creiamo per supperire a main (Al posto di TabBarController)
        window?.rootViewController = vc
        */
        
        // Splashscreen
        revealingSplashView.animationType = .heartBeat
        window?.addSubview(revealingSplashView)
        revealingSplashView.startAnimation()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleHeartAttack), name: heartAttackNotificationName, object: nil)

        //Cambiare colore ai loghi nella Tab Bar
        UITabBar.appearance().tintColor = .black
        
        FirebaseApp.configure() // Connection to Firebase database
        
        return true
    }

    @objc func handleHeartAttack(){
        revealingSplashView.heartAttack = true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

