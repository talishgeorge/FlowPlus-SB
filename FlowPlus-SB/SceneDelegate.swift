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

    /**
     This method is called when a scene is about to be connected to a session.
     It sets up the tab bar controller and assigns it as the root view controller of the window.
     - Parameters:
        - scene: The scene that is about to be connected.
        - session: The session associated with the scene.
        - options: The connection options for the scene.
     */
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabController = setupTabBarController()
        window.rootViewController = tabController
        window.makeKeyAndVisible()
        self.window = window
    }

    /**
     Sets up the tab bar controller with the appropriate view controllers and appearance.
     - Returns: The configured tab bar controller.
     */
    func setupTabBarController() -> UITabBarController {
        
        let tabController = UITabBarController()
        tabController.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 13.0, *) {
            tabController.tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        let vcData: [(UIViewController, UIImage?, UIImage?)] = [
            (createHomeVC(), UIImage(named: "home_tab_icon"), UIImage(named: "home_selected_tab_icon")),
            (createSearchVC(), UIImage(named: "search_tab_icon"), UIImage(named: "search_selected_tab_icon")),
            (createNewPostVC(), UIImage(named: "post_tab_icon"), UIImage(named: "post_tab_icon")),
            (createActivityVC(), UIImage(named: "activity_tab_icon"), UIImage(named: "activity_selected_tab_icon")),
            (createProfileVC(), UIImage(named: "profile_tab_icon"), UIImage(named: "profile_selected_tab_icon")),
        ]

        let vcs = vcData.map { createNavController(rootVC: $0.0, defaultImage: $0.1, selectedImage: $0.2) }

        tabController.viewControllers = vcs
        tabController.tabBar.isTranslucent = false

        return tabController
    }

    /**
     Creates a navigation controller with the specified root view controller and appearance.
     - Parameters:
        - rootVC: The root view controller of the navigation controller.
        - defaultImage: The default image for the tab bar item.
        - selectedImage: The selected image for the tab bar item.
     - Returns: The configured navigation controller.
     */
    func createNavController(rootVC: UIViewController, defaultImage: UIImage?, selectedImage: UIImage?) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootVC)
        if let navBarAppearance = navBarAppearance {
            nav.navigationBar.standardAppearance = navBarAppearance
            if #available(iOS 13.0, *) {
                nav.navigationBar.scrollEdgeAppearance = navBarAppearance
            }
        }
        nav.tabBarItem.image = defaultImage?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        return nav
    }

    /**
     Creates a home view controller from the "Home" storyboard.
     - Returns: The created home view controller.
     */
    func createHomeVC() -> HomeViewController {
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        return homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
    }

    /**
     Creates a search view controller from the "Search" storyboard.
     - Returns: The created search view controller.
     */
    func createSearchVC() -> SearchViewController {
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        return searchStoryboard.instantiateViewController(withIdentifier: "Search") as! SearchViewController
    }

    /**
     Creates a new post view controller from the "NewPost" storyboard.
     - Returns: The created new post view controller.
     */
    func createNewPostVC() -> NewPostViewController {
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        return newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
    }

    /**
     Creates an activity view controller from the "Activity" storyboard.
     - Returns: The created activity view controller.
     */
    func createActivityVC() -> ActiivityViewController {
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        return activityStoryboard.instantiateViewController(withIdentifier: "Activity") as! ActiivityViewController
    }

    /**
     Creates a profile view controller from the "Profile" storyboard.
     - Returns: The created profile view controller.
     */
    func createProfileVC() -> ProfileViewController {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        return profileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
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

    /// Creates a customized tab bar appearance.
    /// - Returns: The customized UITabBarAppearance object.
    static func createTabBarAppearance() -> UITabBarAppearance {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemGray6
        return tabBarAppearance
    }

    /// Sets up a customized navigation bar appearance.
    /// - Returns: The customized UINavigationBarAppearance object.
    func setupNavBarAppearance() -> UINavigationBarAppearance {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemBlue
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        return coloredAppearance
    }
}
