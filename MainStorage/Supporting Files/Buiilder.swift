//
//  DI.swift
//  MainStorage
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Domain
import Foundation

public final class MainStorageRegistrator {
    
    public init() {}
    
    public func registerBuilders() {
        BuilderContainer.default.registerBuilder({ () -> Any in
            return UserRepository()
        }, forType: Domain.UserRepository.self)
    }
}
