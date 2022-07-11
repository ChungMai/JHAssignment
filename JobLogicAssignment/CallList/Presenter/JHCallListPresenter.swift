//
//  JHMenuPresenter.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

final class JHCallListPresenter: JHCallListPresenterProtocol {
    weak var view: JHCallListViewProtocol?
    var interactor: JHCallListInteractorProtocol?
    var router: JHCallListRouterProtocol?
    let disposeBag = DisposeBag()
    
    func retrieveContactsData() {
        self.view?.showLoadingView()
        self.interactor?.retrieveContactsData()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] contacts in
                self?.view?.hideLoadingView()
                self?.view?.reloadView()
            }, onError: { [weak self] error in
                self?.view?.hideLoadingView()
                self?.view?.showError(with: error.localizedDescription)
            })
            .disposed(by: self.disposeBag)
    }
    
    func getContacts() -> [JHContact]? {
        return self.interactor?.getContacts()
    }
}
