//
//  JHMenuTests.swift
//  JobLogicAssignmentTests
//
//  Created by chungmh on 11/07/2022.
//

import Foundation
import XCTest
import RxSwift
@testable import JobLogicAssignment

class JHMenuTests: XCTestCase {
    let disposeBag = DisposeBag()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRouter() {
        class JHMenuRouterMockup: JHMenuRouterProtocol {
            var isCalledNavigateToCallList: Bool = false
            var isCalledNavigateToBuyList: Bool = false
            var isCalledNavigateToSellList: Bool = false
            func navigateToCallList(from viewController: JHMenuViewProtocol?) {
                isCalledNavigateToCallList = true
            }
            
            func navigateToBuyList(from viewController: JHMenuViewProtocol?) {
                isCalledNavigateToBuyList = true
            }
            
            func navigateToSellList(from viewController: JHMenuViewProtocol?) {
                isCalledNavigateToSellList = true
            }
        }
        let view = JHMenuViewController()
        let presenter = JHMenuPresenter()
        let interactor = JHMenuInteractor()
        let router = JHMenuRouterMockup()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        view.navigateToDetailedView(model: JHMenuViewModel(title: "", type: .call))
        XCTAssertTrue(router.isCalledNavigateToCallList)
        XCTAssertFalse(router.isCalledNavigateToBuyList)
        XCTAssertFalse(router.isCalledNavigateToSellList)
    }
    
    func testView() {
        let interactor = JHMenuInteractor()
        interactor.loadInitialData().subscribe (onNext: { items in
            XCTAssertTrue(items.count == 3)
            let callModel = items[0]
            XCTAssertTrue(callModel.type == .call)
            let buyModel = items[1]
            XCTAssertTrue(buyModel.type == .buy)
            let sellModel = items[2]
            XCTAssertTrue(sellModel.type == .sell)
        })
        .disposed(by: disposeBag)
    }
    
    func testPresenter() {
        class JHMenuViewControllerMockup: UIViewController, JHMenuViewProtocol {
            var presenter: JHMenuPresenterProtocol?
            var dataSource = [JHMenuViewModel]()
            func updateView(with models: [JHMenuViewModel]) {
                dataSource = models
            }
        }
        let view = JHMenuViewControllerMockup()
        let presenter = JHMenuPresenter()
        let interactor = JHMenuInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        view.presenter?.loadInitialData()
        XCTAssertTrue(view.dataSource.count == 3)
        let callModel = view.dataSource[0]
        XCTAssertTrue(callModel.type == .call)
    }
}
