//
//  JHOrderListTableViewCell.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit
import SnapKit

final class JHOrderListTableViewCell: UITableViewCell {
    
    private lazy var nameValue: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var priceValue: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        lable.textAlignment = .left
        return lable
    }()

    private lazy var quantityValue: UILabel = {
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
    
    private lazy var priceContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        let priceTitle = UILabel()
        priceTitle.text = "Price : "
        priceTitle.font = UIFont.systemFont(ofSize: 16)
        priceTitle.textColor = .black
        
        stackView.addArrangedSubview(priceTitle)
        priceTitle.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(priceValue)
        priceValue.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }()
    
    private lazy var quantityContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        let quantityTitle = UILabel()
        quantityTitle.text = "Quantity : "
        quantityTitle.font = UIFont.systemFont(ofSize: 16)
        quantityTitle.textColor = .black
        
        stackView.addArrangedSubview(quantityTitle)
        quantityTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(quantityValue)
        quantityValue.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
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
        
        self.addSubview(self.priceContainer)
        self.priceContainer.snp.makeConstraints { make in
            make.top.equalTo(self.nameContainer.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.addSubview(self.quantityContainer)
        self.quantityContainer.snp.makeConstraints { make in
            make.top.equalTo(self.priceContainer.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func updateDataView(contact: JHOrderItemProtocol) {
        self.nameValue.text = contact.name
        self.priceValue.text = String(contact.price)
        self.quantityValue.text = String(contact.quantity)
    }
}
