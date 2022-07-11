//
//  JHCenterErrorView.swift
//  JobLogicAssignment
//
//  Created by chungmh on 11/07/2022.
//

import Foundation
import UIKit
import SnapKit

class JHCenterErrorView: UIView {
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
        return label
    }()

    private lazy var descritionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var seperatedLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    private lazy var tryBtn: UIButton = {
        let btnNext = UIButton(type: .custom)
        btnNext.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btnNext.setTitle("Close", for: .normal)
        btnNext.setTitleColor(UIColor.blue, for: .normal)
        btnNext.addTarget(self,
                          action: #selector(dismissMe),
                          for: .touchUpInside)
        return btnNext
    }()

    private var completed: VoidFunc?
    init(completed: VoidFunc? = nil) {
        super.init(frame: .zero)
        self.setupView()
        self.completed = completed
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
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.containerView.addSubview(descritionLabel)
        self.descritionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.containerView.addSubview(seperatedLine)
        self.seperatedLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.descritionLabel.snp.bottom).offset(16)
            make.height.equalTo(0.5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.containerView.addSubview(self.tryBtn)
        self.tryBtn.snp.makeConstraints { (maker) in
            maker.top.equalTo(seperatedLine.snp.bottom).offset(10)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-10)
        }
    }

    public func setData(message: String) {
        self.titleLabel.text = "Error"
        self.descritionLabel.text = message

    }
    
    @objc private func dismissMe() {
        self.completed?()
        self.removeFromSuperview()
    }
}
