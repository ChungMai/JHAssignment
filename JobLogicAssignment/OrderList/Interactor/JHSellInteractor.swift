//
//  File.swift
//  JobLogicAssignment
//
//  Created by chungmh on 10/07/2022.
//

import Foundation
import CocoaLumberjack
import CoreData
import RxSwift

final class JHSellInteractor: JHOrderInteractorProtocol {
    var orderItem: [JHSellItem]?
    
    init() {
        do {
            let context = CoreDataStorage.shared.managedContext
            let request: NSFetchRequest<JHSellItem> = NSFetchRequest(entityName: String(describing: JHSellItem.self))
            let sells = try context.fetch(request)
            if sells.isEmpty {
                self.makeInitialData()
            }
        } catch let error {
            DDLogInfo(error.localizedDescription)
        }
    }
    
    func getOrderItems() -> [JHSellItem]? {
        return self.orderItem
    }
    
    func makeInitialData() {
        self.createSellItem(id: 1,
                           name: "iPhone X",
                           price: 150000,
                           quantity: 1,
                           type: 2)
        self.createSellItem(id: 2,
                           name: "TV",
                           price: 380000,
                           quantity: 2,
                           type: 2)
        self.createSellItem(id: 3,
                           name: "Table",
                           price: 12000,
                           quantity: 1,
                           type: 2)
    }
    
    func createSellItem(id: Int32,
                       name: String,
                       price: Int32,
                       quantity: Int32,
                       type: Int16)  {
        let context = CoreDataStorage.shared.managedContext
        let sell = JHSellItem(context: context)
        sell.id = id
        sell.name = name
        sell.price = price
        sell.quantity = quantity
        sell.type = type
        do {
            try context.save()
        }
        catch let error {
            DDLogInfo(error.localizedDescription)
        }
    }
    
    func retrieveOrderItemsData() -> Observable<[JHSellItem]> {
        let context = CoreDataStorage.shared.managedContext
        let request: NSFetchRequest<JHSellItem> = NSFetchRequest(entityName: String(describing: JHSellItem.self))
        do {
            let sellItems = try context.fetch(request)
            if sellItems.isEmpty {
                makeInitialData()
                let sellItems = try context.fetch(request)
                return Observable.just(sellItems)
            }
            return Observable.just(sellItems)
        } catch let error {
            DDLogInfo(error.localizedDescription)
            return Observable.just([])
        }
        
    }
}
