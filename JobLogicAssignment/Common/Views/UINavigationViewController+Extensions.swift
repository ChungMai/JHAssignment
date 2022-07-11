//
//  UINavigationViewControllerExtension.swift
//  JobLogicAssignment
//
//  Created by chungmh on 09/07/2022.
//

import Foundation
import UIKit

 extension UINavigationController {
    @objc func defaultNavigationBarStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        let font = UIFont.systemFont(ofSize: 18)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                          NSAttributedString.Key.font: font]
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isTranslucent = true
    }
}
