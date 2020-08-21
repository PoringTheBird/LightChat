//
//  FieldValidator.swift
//  Domain
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

protocol FieldValidator {
    func isValidUsername(_ username: String) -> Bool
    func isValidPassword(_ password: String) -> Bool
}

final class DefaultFieldValidator: FieldValidator {
    
    func isValidUsername(_ username: String) -> Bool {
        return !username.isEmpty
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return !password.isEmpty
    }
}
