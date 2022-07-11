//
//  JHMenuInteractor.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

final class JHCallListInteractor: JHCallListInteractorProtocol {
    let disposeBag = DisposeBag()
    var contacts: [JHContact]?
    func retrieveContactsData() -> Observable<[JHContact]> {
        let urlStr = "https://my-json-server.typicode.com/imkhan334/demo-1/call"
        let signal: Observable<[JHContact]> = NetworkManager.shared.doGet(with: urlStr)
            .do { [weak self] data in
                self?.contacts = data
            } onError: { [weak self] _ in
                self?.contacts = nil
            }
        return signal
    }
    
    func getContacts() -> [JHContact]? {
        return self.contacts
    }
}
