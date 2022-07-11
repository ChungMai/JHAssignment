//
//  JHMenuProtocol.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

protocol JHMenuInteractorProtocol: AnyObject {
    func loadInitialData() -> Observable<[JHMenuViewModel]>
}

protocol JHMenuPresenterProtocol: AnyObject {
    func loadInitialData()
    func navigationToView(with model: JHMenuViewModel)
}

protocol JHMenuViewProtocol: UIViewController {
    func updateView(with models: [JHMenuViewModel])
}

protocol JHMenuRouterProtocol: AnyObject {
    func navigateToCallList(from viewController: JHMenuViewProtocol?)
    func navigateToBuyList(from viewController: JHMenuViewProtocol?)
    func navigateToSellList(from viewController: JHMenuViewProtocol?)
}
