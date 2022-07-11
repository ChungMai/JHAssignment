//
//  JHMenuItemView.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift
import SnapKit

protocol JHMenuItemViewProtocol: AnyObject {
    func navigateToDetailedView(model: JHMenuViewModel)
}

final class JHMenuItemView: UIView {
    private lazy var titleLbl: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .black
        return title
    }()
    
    private var viewModel: JHMenuViewModel
    private weak var delegate: JHMenuItemViewProtocol?
    
    init(data: JHMenuViewModel, delegate: JHMenuItemViewProtocol?) {
        self.viewModel = data
        self.delegate = delegate
        super.init(frame: .zero)
        self.setupSubviews()
        self.setupDataForView()
        self.setupEvents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubviews() {
        self.backgroundColor = .gray
        self.addSubview(titleLbl)
        self.titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
        }
    }
    
    private func setupDataForView() {
        self.titleLbl.text = self.viewModel.title
    }
    
    private func setupEvents() {
        self.isUserInteractionEnabled = true
        let tapGuesture = UITapGestureRecognizer.init(target: self, action: #selector(tapOnView))
        tapGuesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGuesture)
    }
    
    @objc func tapOnView() {
        self.delegate?.navigateToDetailedView(model: self.viewModel)
    }
}
