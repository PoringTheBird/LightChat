//
//  DIContainer.swift
//  Domain
//
//  Created by Nikita Egoshin on 10.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Foundation

public final class BuilderContainer {
    public typealias Builder = () -> Any
    
    public static let `default` = BuilderContainer()
    
    private var builders: [String: Builder] = [:]
    
    public func registerBuilder<ProductType>(_ builder: @escaping Builder, forType productType: ProductType) {
        builders[String(describing: productType)] = builder
    }
    
    public func resolve<ProductType>(_ productType: ProductType.Type) -> ProductType? {
        // swiftlint:disable:next force_cast
        return builders[String(describing: productType)]?() as! ProductType?
    }
}
