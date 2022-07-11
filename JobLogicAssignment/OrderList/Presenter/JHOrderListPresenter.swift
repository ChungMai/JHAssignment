//
//  JHOrderListViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import RxSwift

final class JHOrderListPresenter: JHOrderListPresenterProtocol {
    weak var view: JHOrderListViewProtocol?
    var interactor: JHOrderListInteractorProtocol?
    var router: JHOrderListRouterProtocol?
    let disposeBag = DisposeBag()
    
    func retrieveOrderItemsData(completed: VoidFunc?, error:InputStringFunc?) {
        self.view?.showLoadingView()
        self.interactor?.retrieveOrderItemsData(completed: { [weak self] in
            self?.view?.hideLoadingView()
            self?.view?.reloadView()
            completed?()
        }, error: { [weak self] errMsg in
            self?.view?.hideLoadingView()
            self?.view?.showError(with: errMsg)
        })
    }
    
    func getOrderItems() -> [JHOrderItemProtocol]? {
        return self.interactor?.getOrderItems()
    }
    
    func getOrderType() -> JHOrderType? {
        return self.interactor?.getOrderType()
    }
}
