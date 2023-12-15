//
//  SceneDelegate.swift
//  FlowPlus-SB
//
//  Created by Talish George on 13/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    let navBarAppearance = createNavBarAppearance()
    let tabBarAppearance = createTabBarAppearance()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabControlller = UITabBarController()
        // Set the appearance of the tab bar
        tabControlller.tabBar.standardAppearance = tabBarAppearance
        // For iOS 13 and above, also set the scroll edge appearance of the tab barni
        if #available(iOS 13.0, *) {
            tabControlller.tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "Profile") as? ProfileViewController
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "Search") as? SearchViewController
        let newPostVC = newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as? NewPostViewController
        let activitytVC = activityStoryboard.instantiateViewController(withIdentifier: "Activity") as? ActiivityViewController
        
        var vcData: [(UIViewController, UIImage?, UIImage?)] = []
        
        if let homeVC = homeVC {
            vcData.append((homeVC, UIImage(named: "home_tab_icon"), UIImage(named: "home_selected_tab_icon")))
        }
        if let searchVC = searchVC {
            vcData.append((searchVC, UIImage(named: "search_tab_icon"), UIImage(named: "search_selected_tab_icon")))
        }
        if let newPostVC = newPostVC {
            vcData.append((newPostVC, UIImage(named: "post_tab_icon"), UIImage(named: "post_tab_icon")))
        }
        if let activitytVC = activitytVC {
            vcData.append((activitytVC, UIImage(named: "activity_tab_icon"), UIImage(named: "activity_selected_tab_icon")))
        }
        if let profileVC = profileVC {
            vcData.append((profileVC, UIImage(named: "profile_tab_icon"), UIImage(named: "profile_selected_tab_icon")))
        }
        
        let vcs = vcData.map { vc, defaultImage, selectedImage -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = defaultImage?.withRenderingMode(.alwaysOriginal)
            nav.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
            return nav
        }
        tabControlller.viewControllers = vcs
        tabControlller.tabBar.isTranslucent = false
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = .white // Set desired background color
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .gray
            tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .blue
            tabControlller.tabBar.standardAppearance = tabBarAppearance
        } else {
            tabControlller.tabBar.barTintColor = .white
        }
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemBlue
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        
        window.rootViewController = tabControlller
        print("Root view controller: \(window.rootViewController)")
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        window.makeKeyAndVisible()
        self.window = window
    }
    
    /// Creates a customized navigation bar appearance.
    /// - Returns: The customized UINavigationBarAppearance object.
    static func createNavBarAppearance() -> UINavigationBarAppearance? {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray6
        UINavigationBar.appearance().tintColor = .systemGreen
        return appearance
    }
    
    /// Creates a customized appearance for the tab bar.
    /// - Returns: A `UITabBarAppearance` object with the customized appearance.
    static func createTabBarAppearance() -> UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemGray6
        return tabBarAppearance
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

