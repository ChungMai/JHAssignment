//
//  JHMenuInteractor.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import UIKit

final class JHCallListRouter: JHCallListRouterProtocol {
    static func assembleModule() -> UIViewController {
        let view = JHCallListViewController()
        let presenter = JHCallListPresenter()
        let interactor = JHCallListInteractor()
        let router = JHCallListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
