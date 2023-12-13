//
//  AppDelegate.swift
//  FlowPlus-SB
//
//  Created by Talish George on 13/12/2023.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var window: UIWindow?
        // Override point for customization after application launch.
        let tabControlller = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        let newPostVC = newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
        let activitytVC = activityStoryboard.instantiateViewController(withIdentifier: "Activity") as! ActiivityViewController
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
            (homeVC, UIImage(named: "home_tab_icon")!, UIImage(named: "home_selected_tab_icon")!),
            (searchVC, UIImage(named: "search_tab_icon")!, UIImage(named: "search_selected_tab_icon")!),
            (newPostVC, UIImage(named: "post_tab_icon")!, UIImage(named: "post_tab_icon")!),
            (activitytVC, UIImage(named: "activity_tab_icon")!, UIImage(named: "activity_selected_tab_icon")!),
            (searchVC, UIImage(named: "profile_tab_icon")!, UIImage(named: "profile_selected_tab_icon")!),
        ]
        
        let vcs = vcData.map { vc, _, selectedImage -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = selectedImage
            nav.tabBarItem.selectedImage = selectedImage
            return nav
        }
        
        tabControlller.viewControllers = vcs
        tabControlller.tabBar.isTranslucent = false
        
        if let items = tabControlller.tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                if let selectedImage = item.selectedImage {
                    item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        window?.rootViewController = tabControlller
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "FlowPlus_SB")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
