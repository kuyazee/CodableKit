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

    func decode<T: Decodable>(data: Data) throws -> T
}

extension AnyDecoder {
    public func decode<T>(data: Data) throws -> T where T : Decodable {
        return try self.decode(T.self, from: data)
    }
}

extension JSONDecoder: AnyDecoder {}
extension PropertyListDecoder: AnyDecoder {}

public protocol AnyFileDecoder {
    func decode<T: Decodable>(_ type: T.Type, from file: File) throws -> T

    func decode<T: Decodable>(file: File) throws -> T
}

extension AnyFileDecoder {
    public func decode<T>(file: File) throws -> T where T : Decodable {
        return try self.decode(T.self, from: file)
    }
}


