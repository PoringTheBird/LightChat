//
//  AuthGateway.swift
//  Application
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import UIKit

public protocol AuthUseCase: AnyObject {
    func signInWithUsername(_ username: String, password: String, completion: @escaping (Result<String, Error>) -> Void)
}

final class DefaultAuthUseCase: AuthUseCase {

    private let fieldValidator: FieldValidator
    private let authenticator: Authenticator
    private let repository: UserRepository
    
    // MARK: - Lifecycle
    
    init(fieldValidator: FieldValidator, authenticator: Authenticator, repository: UserRepository) {
        self.fieldValidator = fieldValidator
        self.authenticator = authenticator
        self.repository = repository
    }
    
    // MARK: - Actions
    
    func signInWithUsername(_ username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        guard fieldValidator.isValidUsername(username) else { completion(.failure(CommonError(message: "Invalid username"))); return }
        guard fieldValidator.isValidUsername(password) else { completion(.failure(CommonError(message: "Invalid password"))); return }
        
        authenticator.authenticateWithUsername(username, password: password) { (result) in
            switch result {
            case .success(let user):
                self.repository.saveUser(user: user, completion: { result in
                    switch result {
                    case .success(let user):
                        completion(.success(user.username))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
