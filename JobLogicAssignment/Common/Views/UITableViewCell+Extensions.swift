//
//  UITableViewCell+Extensions.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func createCell(for tableView: UITableView) -> Self {
        let identifier = String(describing: Self.self)
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier)
        guard let cell = tableViewCell as? Self else {
            return Self.init(style: .default, reuseIdentifier: identifier)
        }

        return cell
    }
}
