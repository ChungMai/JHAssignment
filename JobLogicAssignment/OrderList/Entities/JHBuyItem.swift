//
//  JHBuyModel.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import CocoaLumberjack

class JHBuyItemList: Codable {
    static func from(data: Data) -> [JHBuyItem]? {
        do {
            return try JHBuyItemList.parseList(from: data)
        } catch let error {
            #if DEBUG
            assertionFailure(error.localizedDescription)
            #endif
        }

        return nil
    }
}

class JHBuyItem: Codable, JHOrderItemProtocol{
    var id: Int32 = 0
    var name: String?
    var price: Int32 = 0
    var quantity: Int32 = 0
    var type: Int16 = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case quantity
        case type
    }
    
    required init(from decoder: Decoder)  throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(Int32.self, forKey: .id)
            self.name = try? container.decode(String.self, forKey: .name)
            self.price = try container.decode(Int32.self, forKey: .price)
            self.quantity = try container.decode(Int32.self, forKey: .quantity)
            self.type = try container.decode(Int16.self, forKey: .type)
        } catch let error {
            DDLogDebug("Error: \(error.localizedDescription)")
        }
    }
    
    static func from(data: Data) -> JHBuyItem? {
        do {
            return try JHBuyItem.parse(from: data)
        } catch let error {
            #if DEBUG
            assertionFailure(error.localizedDescription)
            #endif
        }

        return nil
    }
}
