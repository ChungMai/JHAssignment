//
//  ViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import UIKit
import RxSwift
import SnapKit


final class JHCallListViewController: BaseViewController {
    
    let disposeBg = DisposeBag()
    var presenter: JHCallListPresenterProtocol?
    
    private var contacts: [JHContact] {
        return self.presenter?.getContacts() ?? []
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
        self.presenter?.retrieveContactsData()
    }
    
    private func setupViewStyles() {
        self.view.backgroundColor = .white
        self.title = "Call List"
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension JHCallListViewController: JHCallListViewProtocol {
    func reloadView() {
        self.tableView.reloadData()
    }
}

extension JHCallListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = JHCallListTableCellView.createCell(for: tableView)
        let contact = self.contacts[indexPath.row]
        cellView.updateDataView(contact: contact)
        return cellView
    }
}

extension JHCallListViewController: UITableViewDelegate {
    
}
