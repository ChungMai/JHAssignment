//
//  JHOrderListViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit
import RxSwift

protocol JHOrderItemProtocol {
    var name: String? { get set }
    var price: Int32 { get set }
    var quantity: Int32 { get set }
}

protocol JHOrderInteractorProtocol {
    associatedtype T: JHOrderItemProtocol
    var orderItem: [T]? { get set }
    
    func makeInitialData()
    func retrieveOrderItemsData() -> Observable<[T]>
    func getOrderItems() -> [T]?
}

extension JHOrderInteractorProtocol {
    func makeInitialData() {}
}

protocol JHOrderListViewProtocol: UIViewController {
    func reloadView()
    func showError(with message: String)
    func showLoadingView()
    func hideLoadingView()
}

protocol JHOrderListPresenterProtocol: AnyObject {
    func retrieveOrderItemsData(completed: VoidFunc?, error:InputStringFunc?)
    func getOrderItems() -> [JHOrderItemProtocol]?
    func getOrderType() -> JHOrderType?
}

protocol JHOrderListRouterProtocol: AnyObject {
    
}

protocol JHOrderListInteractorProtocol: AnyObject {
    func retrieveOrderItemsData(completed: VoidFunc?, error:InputStringFunc?)
    func getOrderItems() -> [JHOrderItemProtocol]?
    func getOrderType() -> JHOrderType
}





