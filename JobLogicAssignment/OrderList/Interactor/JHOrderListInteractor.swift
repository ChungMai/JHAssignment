//
//  JHOrderListViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import RxSwift
import UIKit
import CocoaLumberjack
enum JHOrderType {
    case buy
    case sell
    
    var naviBarTitle: String {
        switch self {
        case .buy:
            return "Buy List"
        case .sell:
            return "Sell List"
        }
    }
}

public class JHOrderListInteractor: JHOrderListInteractorProtocol {
    let disposeBag = DisposeBag()
    var orderItem: [JHOrderItemProtocol]?
    weak var presenter: JHOrderListPresenterProtocol?
    
    private var type: JHOrderType
    init(type: JHOrderType) {
        self.type = type
    }
    
    func retrieveOrderItemsData(completed: VoidFunc?, error:InputStringFunc?) {
        switch self.type {
        case .buy:
            let buyHandler = JHBuyInteractor()
            self.retrieveOrderItemsData(handler: buyHandler,
                                        completed: completed,
                                        error: error)
        case .sell:
            let sellHandler = JHSellInteractor()
            self.retrieveOrderItemsData(handler: sellHandler,
                                        completed: completed,
                                        error: error)
        }
    }
    
    func retrieveOrderItemsData<Handler: JHOrderInteractorProtocol>(handler: Handler,
                                                                    completed:VoidFunc?,
                                                                    error:InputStringFunc?) {
        return handler.retrieveOrderItemsData()
            .subscribe { [weak self] values in
                self?.orderItem = values
                DispatchQueue.main.async {
                    completed?()
                }
            } onError: { err in
                DDLogInfo(err.localizedDescription)
                DispatchQueue.main.async {
                    error?(err.localizedDescription)
                }
            }
            .disposed(by: self.disposeBag)
    }
    
    func getOrderItems() -> [JHOrderItemProtocol]? {
        return self.orderItem
    }
    
    func getOrderType() -> JHOrderType {
        return self.type
    }
}
