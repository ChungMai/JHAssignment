//
//  JHMenuInteractor.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import UIKit

final class JHMenuRouter: JHMenuRouterProtocol {
    static func assumbleModule() -> JHMenuViewProtocol {
        let view = JHMenuViewController()
        let presenter = JHMenuPresenter()
        let interactor = JHMenuInteractor()
        let router = JHMenuRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
    func navigateToCallList(from viewController: JHMenuViewProtocol?) {
        guard let viewController = viewController else {
            return
        }

        let view = JHCallListRouter.assembleModule()
        viewController.navigationController?.pushViewController(view,
                                                                animated: true)
    }
    
    func navigateToSellList(from viewController: JHMenuViewProtocol?) {
        guard let viewController = viewController else {
            return
        }
        
        let view = JHOrderListRouter.assembleModule(type: .sell)
        viewController.navigationController?.pushViewController(view,
                                                                animated: true)
    }
    
    func navigateToBuyList(from viewController: JHMenuViewProtocol?) {
        guard let viewController = viewController else {
            return
        }
        
        let view = JHOrderListRouter.assembleModule(type: .buy)
        viewController.navigationController?.pushViewController(view,
                                                                animated: true)
    }
}
