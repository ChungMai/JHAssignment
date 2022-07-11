//
//  JHMenuViewModel.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation

enum JHMenuViewType {
    case call
    case buy
    case sell
}

struct JHMenuViewModel {
    let title: String
    let type: JHMenuViewType
}
