//
//  Extensions.swift
//  CodableKit
//
//  Created by Zonily Jame Pesquera on 13/02/2019.
//  Copyright © 2019 com.kuyazee. All rights reserved.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    public func decode<T: Decodable>(forKey key: Key) throws -> T {
        return try self.decode(T.self, forKey: key)
    }

    public func decode<T: Decodable>(forKey key: Key, default defaultExpression: @autoclosure () -> T) throws -> T {
        return try self.decodeIfPresent(T.self, forKey: key) ?? defaultExpression()
    }
}

extension Encodable {
    public func encoded(using encoder: AnyEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }

    public func jsonData(_ encoder: AnyEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }

    public func json(encoder: AnyEncoder = JSONEncoder(), encoding: String.Encoding = .utf8) throws -> String {
        let data = try self.jsonData(encoder)
        return try String(data: data, encoding: encoding).unwrap()
    }
}

extension Data {
    public func decoded<T: Decodable>(using decoder: AnyDecoder = JSONDecoder()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
}

extension Decodable {
    public init(data: Data, decoder: AnyDecoder = JSONDecoder()) throws {
        self = try decoder.decode(Self.self, from: data)
    }

    public init(
        _ json: String,
        using encoding: String.Encoding,
        decoder: AnyDecoder = JSONDecoder()
    ) throws {
        let data = try json.data(using: encoding).unwrap()
        try self.init(data: data, decoder: decoder)
    }

    public init(fromURL url: String, decoder: AnyDecoder = JSONDecoder()) throws {
        let url = try URL(string: url).unwrap()
        let data = try Data(contentsOf: url)
        try self.init(data: data, decoder: decoder)
    }
}

extension UserDefaults {
    public func setCodable<T: Codable>(_ value: T?, forKey key: String, encoder: AnyEncoder = JSONEncoder()) {
        guard let value = value else {
            self.set(nil, forKey: key)
            self.synchronize()
            return
        }
        do {
            let data = try encoder.encode(value)
            self.set(data, forKey: key)
        } catch {
            self.set(nil, forKey: key)
        }
        self.synchronize()
    }

    public func codableObject<T: Codable>(forKey key: String, decoder: AnyDecoder = JSONDecoder()) -> T? {
        guard let data = self.data(forKey: key) else {
            return nil
        }

        return try? decoder.decode(data)
    }
}
