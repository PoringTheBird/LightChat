//
//  AuthConfigurator.swift
//  Application
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Domain
import UIKit

// swiftlint:disable force_cast

final class AuthConfigurator {
    
    private let storyboard = UIStoryboard(name: "Auth", bundle: nil)
    
    // MARK: - Lifecycle
    
    init() {}
    
    // MARK: - Configuration
    
    func configure() -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "AuthViewController") as! AuthViewController
        let navigationController = UINavigationController(rootViewController: vc)
        let navigator = DefaultAuthNavigator(navigationController: navigationController)
        
        vc.presenter = AuthPresenter(view: vc, navigator: navigator, useCase: UseCaseProvider.makeAuthUseCase())
        
        return vc
    }
}

// swiftlint:enable force_cast
