//
//  Authenticator.swift
//  Domain
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

final class Authenticator {
    
    func authenticateWithUsername(_ username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let user = User(uid: UUID().uuidString, username: username)
        completion(.success(user))
    }
}
