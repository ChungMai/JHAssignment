//
//  DictionaryExtension.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import CocoaLumberjack

public extension Dictionary where Key == String, Value == Any {
    var toData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch let error {
            DDLogError("Parse parameter error: \(error.localizedDescription)")
            return nil
        }
    }
}
