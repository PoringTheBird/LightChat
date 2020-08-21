//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

// swiftlint:disable force_unwrapping

public final class UseCaseProvider {
    
    public static func makeAuthUseCase() -> AuthUseCase {
        return DefaultAuthUseCase(fieldValidator: DefaultFieldValidator(),
                                  authenticator: Authenticator(),
                                  repository: BuilderContainer.default.resolve(UserRepository.self)!)
    }
}

// swiftlint:enable force_unwrapping
