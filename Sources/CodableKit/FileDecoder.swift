//
//  FileDecoder.swift
//  CodableKit
//
//  Created by Zonily Jame Pesquera on 13/02/2019.
//  Copyright © 2019 com.kuyazee. All rights reserved.
//

import Foundation

open class FileDecoder: AnyFileDecoder {
    open var decoder: AnyDecoder
    open var bundle: Bundle = .main
    open var fileManager: FileManager = .default

    public init(decoder: AnyDecoder, bundle: Bundle = .main, fileManager: FileManager = .default) {
        self.decoder = decoder
        self.bundle = bundle
        self.fileManager = fileManager
    }

    open func decode<T: Decodable>(_ type: T.Type, from file: File) throws -> T {
        guard let path = self.bundle.path(
            forResource: file.name,
            ofType: file.type,
            inDirectory: file.directory,
            forLocalization: file.localization) else {
                throw FileDecodingError.cannotFindFile(file)
        }

        guard let data = self.fileManager.contents(atPath: path) else {
            throw FileDecodingError.invalidDataForFile(file)
        }

        return try self.decoder.decode(type, from: data)
    }
}

open class JSONFileDecoder: AnyFileDecoder {
    public let decoder: AnyFileDecoder

    public init(decoder: AnyFileDecoder = FileDecoder(decoder: JSONDecoder())) {
        self.decoder = decoder
    }

    open func decode<T>(_ type: T.Type, from file: File) throws -> T where T: Decodable {
        return try self.decoder.decode(type, from: file)
    }
}

class PropertyListFileDecoder: AnyFileDecoder {
    public let decoder: AnyFileDecoder

    public init(decoder: AnyFileDecoder = FileDecoder(decoder: PropertyListDecoder())) {
        self.decoder = decoder
    }

    open func decode<T>(_ type: T.Type, from file: File) throws -> T where T: Decodable {
        return try self.decoder.decode(type, from: file)
    }
}
