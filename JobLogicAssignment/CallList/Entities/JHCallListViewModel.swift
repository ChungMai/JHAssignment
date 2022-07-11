//
//  JHMenuViewModel.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import CocoaLumberjack

class JHContactList: Codable {
    static func from(data: Data) -> [JHContact]? {
        do {
            return try JHContactList.parseList(from: data)
        } catch let error {
            #if DEBUG
            assertionFailure(error.localizedDescription)
            #endif
        }

        return nil
    }
}

class JHContact: Codable {
    var id: Int?
    var name: String?
    var number: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case number
    }
    
    required init(from decoder: Decoder)  throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try? container.decode(Int.self, forKey: .id)
            self.name = try? container.decode(String.self, forKey: .name)
            self.number = try? container.decode(String.self, forKey: .number)
        } catch let error {
            DDLogDebug("Error: \(error.localizedDescription)")
        }
    }
    
    static func from(data: Data) -> JHContact? {
        do {
            return try JHContact.parse(from: data)
        } catch let error {
            #if DEBUG
            assertionFailure(error.localizedDescription)
            #endif
        }

        return nil
    }
}


