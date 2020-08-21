//
//  CommonError.swift
//  Domain
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

public struct CommonError: LocalizedError {
    
    public var errorDescription: String? { message }
    
    private let message: String
    
    public init(message: String) {
        self.message = message
    }
}
