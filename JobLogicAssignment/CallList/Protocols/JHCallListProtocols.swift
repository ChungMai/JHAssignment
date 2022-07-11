//
//  JHMenuProtocol.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

protocol JHCallListInteractorProtocol: AnyObject {
    func getContacts() -> [JHContact]?
    func retrieveContactsData() -> Observable<[JHContact]> 
}

protocol JHCallListPresenterProtocol: AnyObject {
    func getContacts() -> [JHContact]?
    func retrieveContactsData()
}

protocol JHCallListViewProtocol: UIViewController {
    func reloadView()
    func showLoadingView()
    func hideLoadingView()
    func showError(with message: String)
}

protocol JHCallListRouterProtocol: AnyObject {
    
}
