//
//  File.swift
//  JobLogicAssignment
//
//  Created by chungmh on 10/07/2022.
//

import Foundation
import RxSwift

final class JHBuyInteractor: JHOrderInteractorProtocol {
    var orderItem: [JHBuyItem]?
    func retrieveOrderItemsData() -> Observable<[JHBuyItem]> {
        let urlStr = "https://my-json-server.typicode.com/imkhan334/demo-1/buy"
        let signal: Observable<[JHBuyItem]> = NetworkManager.shared.doGet(with: urlStr)
            .do { [weak self] data in
                self?.orderItem = data
            } onError: { [weak self] _ in
                self?.orderItem = nil
            }
        return signal
    }
    
    func getOrderItems() -> [JHBuyItem]? {
        return self.orderItem
    }
}
