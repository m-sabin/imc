//
//  SceneDelegate.swift
//  Imci
//
//  Created by sabin  on 10/11/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions
    
    ){
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        
        let calculatorVC = CalculatorViewController()
        
        let navigationController = UINavigationController(
            rootViewController: calculatorVC
        )
                
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
    }

}

