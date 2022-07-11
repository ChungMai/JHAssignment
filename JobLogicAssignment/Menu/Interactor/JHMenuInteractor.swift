//
//  JHMenuInteractor.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

final class JHMenuInteractor: JHMenuInteractorProtocol {
    func loadInitialData() -> Observable<[JHMenuViewModel]> {
        var result = [JHMenuViewModel]()
        
        let callModel = JHMenuViewModel(title: "Call List", type: .call)
        result.append(callModel)
        
        let buyModel = JHMenuViewModel(title: "Buy List", type: .buy)
        result.append(buyModel)
        
        let sellModel = JHMenuViewModel(title: "Sell List", type: .sell)
        result.append(sellModel)
        
        return Observable.just(result)
    }
}
