//
//  JHOrderListTest.swift
//  JobLogicAssignmentTests
//
//  Created by chungmh on 11/07/2022.
//

import Foundation
import XCTest
import RxSwift
@testable import JobLogicAssignment

let response = """
[
  {
    "id": 1,
    "name": "MacBook Pro",
    "price": 205000,
    "quantity": 1,
    "type": 1
  },
  {
    "id": 2,
    "name": "iPad",
    "price": 20000,
    "quantity": 2,
    "type": 1
  },
  {
    "id": 3,
    "name": "Power Bank",
    "price": 10000,
    "quantity": 4,
    "type": 1
  }
]
"""
final class JHBuyInteractorMockup: JHOrderInteractorProtocol {
    var orderItem: [JHBuyItem]?
    func retrieveOrderItemsData() -> Observable<[JHBuyItem]> {
        guard let data = response.data(using: .utf8) else {
            return Observable.just([])
        }
        do {
            let result = try [JHBuyItem].parse(from: data)
            return Observable.just(result)
        } catch {
            return Observable.just([])
        }
    }
    
    func getOrderItems() -> [JHBuyItem]? {
        return self.orderItem
    }
}

extension JHOrderListInteractor {
    func retrieveOrderItemsDataMockup(completed: VoidFunc?, error: InputStringFunc?) {
        let sellHandler = JHBuyInteractorMockup()
        self.retrieveOrderItemsData(handler: sellHandler,
                                    completed: completed,
                                    error: error)
    }
}

class JHOrderListTests: XCTestCase {
    let disposeBag = DisposeBag()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBuyInteractor() {
        let interactor = JHOrderListInteractor(type: .buy)
        interactor.retrieveOrderItemsDataMockup(completed: nil, error: nil)
        guard let data = interactor.orderItem, let firstItem = data.first else {
            return
        }
        
        XCTAssertTrue(data.count == 3)
        XCTAssertEqual(firstItem.name, "MacBook Pro")
        XCTAssertEqual(firstItem.price, 205000)
        XCTAssertEqual(firstItem.quantity, 1)
    }
    
    func testSellInteractor() {
        let interactor = JHOrderListInteractor(type: .sell)
        interactor.retrieveOrderItemsData(completed: nil, error: nil)
        guard let data = interactor.orderItem, let firstItem = data.first else {
            return
        }
        
        XCTAssertTrue(data.count == 3)
        XCTAssertEqual(firstItem.name, "iPhone X")
        XCTAssertEqual(firstItem.price, 150000)
        XCTAssertEqual(firstItem.quantity, 1)
    }
    
    func testPresenter() {
        let presenter = JHOrderListPresenter()
        let interactor = JHOrderListInteractor(type: .sell)
        
        presenter.interactor = interactor
        
        presenter.interactor?.retrieveOrderItemsData(completed: nil, error: nil)
        
        guard let data = interactor.getOrderItems(), let firstItem = data.first else {
            return
        }
        
        XCTAssertTrue(data.count == 3)
        XCTAssertEqual(firstItem.name, "iPhone X")
        XCTAssertEqual(firstItem.price, 150000)
        XCTAssertEqual(firstItem.quantity, 1)
    }
    
    func testView() {
        let view = JHOrderListViewController()
        let presenter = JHOrderListPresenter()
        let interactor = JHOrderListInteractor(type: .sell)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter?.retrieveOrderItemsData(completed: nil, error: nil)
        XCTAssertEqual(view.orderItems.count, 3)
        guard let firstItem = view.orderItems.first else {
            XCTFail("First Order Item Should Existed Here")
            return
        }
        XCTAssertEqual(firstItem.name, "iPhone X")
        XCTAssertEqual(firstItem.price, 150000)
        XCTAssertEqual(firstItem.quantity, 1)
    }
    
    func testReloadView() {
        class JHOrderListViewControllerMockup: BaseViewController, JHOrderListViewProtocol {
            var isCalledReloadView: Bool = false
            var presenter: JHOrderListPresenter?
            func reloadView() {
                isCalledReloadView = true
            }
        }
        
        let view = JHOrderListViewControllerMockup()
        let presenter = JHOrderListPresenter()
        let interactor = JHOrderListInteractor(type: .sell)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        
        let expectation = expectation(description: "Reload Data")
        view.presenter?.retrieveOrderItemsData(
            completed: {
                expectation.fulfill()
            },
            error: nil)
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(view.isCalledReloadView)
    }
}
