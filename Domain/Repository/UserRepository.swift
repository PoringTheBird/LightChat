//
//  UserRepository.swift
//  Domain
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

public protocol UserRepository {
    func userWithID(_ userID: String) -> User?
    func saveUser(user: User, completion: @escaping (Result<User, Error>) -> Void)
}
