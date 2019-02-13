//
//  AnyCodable.swift
//  CodableKit
//
//  Created by Zonily Jame Pesquera on 13/02/2019.
//  Copyright © 2019 com.kuyazee. All rights reserved.
//

import Foundation

public protocol AnyDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

public protocol AnyFileDecoder {
    func decode<T: Decodable>(_ type: T.Type, from file: File) throws -> T
}

extension JSONDecoder: AnyDecoder {}

extension PropertyListDecoder: AnyDecoder {}
