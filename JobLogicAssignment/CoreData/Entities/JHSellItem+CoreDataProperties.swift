//
//  SellItem+CoreDataProperties.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//
//

import Foundation
import CoreData


extension JHSellItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JHSellItem> {
        return NSFetchRequest<JHSellItem>(entityName: "JHSellItem")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var price: Int32
    @NSManaged public var quantity: Int32
    @NSManaged public var type: Int16

}

extension JHSellItem : Identifiable {

}

extension JHSellItem : JHOrderItemProtocol {
    
}
