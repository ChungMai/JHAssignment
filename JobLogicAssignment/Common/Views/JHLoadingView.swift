//
//  JHLoadingView.swift
//  JobLogicAssignment
//
//  Created by chungmh on 11/07/2022.
//

import Foundation
import UIKit
import SnapKit

class JHLoadingView: UIView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.0
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = "Loading ..."
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        
        self.addSubview(containerView)
        self.containerView.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().offset(40)
            maker.top.greaterThanOrEqualToSuperview()
        }
        
        self.containerView.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-32)
        }
    }

}
