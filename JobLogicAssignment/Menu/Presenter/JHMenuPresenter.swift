//
//  JHMenuPresenter.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

final class JHMenuPresenter: JHMenuPresenterProtocol {
    weak var view: JHMenuViewProtocol?
    var interactor: JHMenuInteractorProtocol?
    var router: JHMenuRouterProtocol?
    let disposeBag = DisposeBag()
    
    func loadInitialData() {
        self.interactor?.loadInitialData()
            .subscribe(onNext: { [weak self] values in
                self?.view?.updateView(with: values)
            })
            .disposed(by: self.disposeBag)
    }
    
    func navigationToView(with model: JHMenuViewModel) {
        switch model.type {
        case .call:
            self.router?.navigateToCallList(from: self.view)
        case .sell:
            self.router?.navigateToSellList(from: self.view)
        case .buy:
            self.router?.navigateToBuyList(from: self.view)
        }
    }
    
}
