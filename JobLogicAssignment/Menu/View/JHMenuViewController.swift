//
//  ViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import UIKit
import RxSwift
import SnapKit


final class JHMenuViewController: UIViewController {
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 50
        return stackView
    }()
    
    let disposeBg = DisposeBag()
    var presenter: JHMenuPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupSubviews()
        self.setupViewStyles()
        self.presenter?.loadInitialData()
    }
    
    private func setupViewStyles() {
        self.title = "Menu"
        self.view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension JHMenuViewController: JHMenuViewProtocol {
    func updateView(with models: [JHMenuViewModel]) {
        for model in models {
            let itemView = JHMenuItemView(data: model, delegate: self)
            self.containerView.addArrangedSubview(itemView)
        }
    }
}

extension JHMenuViewController: JHMenuItemViewProtocol {
    func navigateToDetailedView(model: JHMenuViewModel) {
        self.presenter?.navigationToView(with: model)
    }
}

