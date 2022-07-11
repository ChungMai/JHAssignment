//
//  BaseViewController.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    private lazy var backBarItems: [UIBarButtonItem] = {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage.init(named: "back_icon"), for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.addTarget(self, action: #selector(doBack), for: .touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        
        return  [backBarButtonItem]
    }()
    
    private var loadingView: JHLoadingView = {
        let view = JHLoadingView()
        return view
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItems = backBarItems
    }

    @objc func doBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showError(with message: String) {
        let errorView = JHCenterErrorView(completed: nil)
        self.view.addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        errorView.setData(message: message)
    }
    
    func showLoadingView() {
        self.view.addSubview(self.loadingView)
        self.loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func hideLoadingView() {
        self.loadingView.removeFromSuperview()
    }
}
