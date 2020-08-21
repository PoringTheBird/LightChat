//
//  Builders.swift
//  Application
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import MainStorage
import Foundation

final class Builders {
    
    static func register() {
        MainStorageRegistrator().registerBuilders()
    }
}
