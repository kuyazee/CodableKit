//
//  Decodable.swift
//  CodableKit
//
//  Created by z on 20/09/2019.
//  Copyright © 2019 com.kuyazee. All rights reserved.
//

import Foundation

public extension Decodable {
    init(data: Data, decoder: AnyDecoder = JSONDecoder()) throws {
        self = try decoder.decode(Self.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding, decoder: AnyDecoder = JSONDecoder()) throws {
        let data = try json.data(using: encoding).unwrap()
        try self.init(data: data, decoder: decoder)
    }
    
    init(fromURL url: String, decoder: AnyDecoder = JSONDecoder()) throws {
        let url = try URL(string: url).unwrap()
        let data = try Data(contentsOf: url)
        try self.init(data: data, decoder: decoder)
    }
}
