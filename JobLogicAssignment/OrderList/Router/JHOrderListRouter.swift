//
//  JHOrderListViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit

final class JHOrderListRouter: JHOrderListRouterProtocol {
    static func assembleModule(type: JHOrderType) -> UIViewController {
        let view = JHOrderListViewController()
        let presenter = JHOrderListPresenter()
        let interactor = JHOrderListInteractor(type: type)
        let router = JHOrderListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
