//
//  DecodeExtensions.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation

public extension Decodable {
    static func parse(from data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(self, from: data)
    }
    
    static func parseList<T:Decodable>(from data: Data) throws -> [T] {
        let decoder = JSONDecoder()
        return try decoder.decode([T].self, from: data)
    }
}
