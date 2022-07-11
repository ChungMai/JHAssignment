//
//  JHOrderListViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit

final class JHOrderListViewController: BaseViewController {
    var presenter: JHOrderListPresenterProtocol?
    var orderItems: [JHOrderItemProtocol] {
        return self.presenter?.getOrderItems() ?? []
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
        self.setupViewStyles()
        // Do any additional setup after loading the view.
        self.presenter?.retrieveOrderItemsData(completed: nil, error: nil)
    }

    private func setupSubviews() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupViewStyles() {
        self.view.backgroundColor = .white
        self.title = self.presenter?.getOrderType()?.naviBarTitle
    }
}

extension JHOrderListViewController: JHOrderListViewProtocol {
    func reloadView() {
        self.tableView.reloadData()
    }
}

extension JHOrderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = JHOrderListTableViewCell.createCell(for: tableView)
        let buyItem = self.orderItems[indexPath.row]
        cellView.updateDataView(contact: buyItem)
        return cellView
    }
}

extension JHOrderListViewController: UITableViewDelegate {
    
}
