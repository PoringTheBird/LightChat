//
//  UserRepository.swift
//  MainStorage
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Domain
import Foundation

final class UserRepository: Domain.UserRepository {
    
    private var users: [Domain.User] = []
    
    func userWithID(_ userID: String) -> User? {
        return users.first(where: { $0.uid == userID })
    }
    
    func saveUser(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        users.append(user)
        
        if let user = userWithID(user.uid) {
            completion(.success(user))
        } else {
            completion(.failure(CommonError(message: "Unable to save user")))
        }
    }
}
