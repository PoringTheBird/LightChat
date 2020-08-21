//
//  AuthNavigator.swift
//  Application
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import UIKit

protocol AuthNavigator {
    
}

final class DefaultAuthNavigator: AuthNavigator {

    private unowned var navigationController: UINavigationController
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Navigation
    
    // Declare here navigation actions

}
