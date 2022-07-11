//
//  JHCallListTableCellView.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit
import SnapKit

final class JHCallListTableCellView: UITableViewCell {
    
    private lazy var nameValue: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        lable.textAlignment = .left
        return lable
    }()

    private lazy var numberValue: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var nameContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        let nameTitle = UILabel()
        nameTitle.text = "Name : "
        nameTitle.font = UIFont.systemFont(ofSize: 16)
        nameTitle.textColor = .black
        
        stackView.addArrangedSubview(nameTitle)
        nameTitle.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(nameValue)
        nameValue.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }()
    
    private lazy var numberContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        let numberTitle = UILabel()
        numberTitle.text = "Number : "
        numberTitle.font = UIFont.systemFont(ofSize: 16)
        numberTitle.textColor = .black
        
        stackView.addArrangedSubview(numberTitle)
        numberTitle.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(numberValue)
        numberValue.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        self.addSubview(self.nameContainer)
        self.nameContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.addSubview(self.numberContainer)
        self.numberContainer.snp.makeConstraints { make in
            make.top.equalTo(self.nameContainer.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func updateDataView(contact: JHContact) {
        self.nameValue.text = contact.name
        self.numberValue.text = contact.number
    }
}
