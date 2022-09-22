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
    let queue1 = DispatchQueue(label: "com.chungmai")
    let labelValue = "com.raywenderlich.mycoolapp.networking"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupSubviews()
        self.setupViewStyles()
        self.presenter?.loadInitialData()
        Task {
            print(Date())
            var value = ""
            var value1 = ""
            
            async let mf = myFunction()
            async let mf1 = myFunction1()
            
            await value = mf
            print(value)
            await value1 = mf1
            print(value1)
            
            print("Completed Task 3")
            print(Date())
        }
    }
    
    func myFunction() async -> String {
        print("execute Task")
        try! await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        return "Chung"
    }
    
    typealias completed = () -> ()

    func parseData(completed: completed) {
        save(completed: completed)
    }

    func save(completed: completed) {
        completed()
    }

    func myFunction1() async -> String {
        print("execute Task 1")
        try! await Task.sleep(nanoseconds: 6 * 1_000_000_000)
        return "Chung 1"
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

