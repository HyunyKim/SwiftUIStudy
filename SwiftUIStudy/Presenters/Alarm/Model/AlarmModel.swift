//
//  AlarmModel.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/12/24.
//

import Foundation

enum AlarmType: String {
    case notice
    case transfer
    case event
}

struct AlarmModel {
    let type: AlarmType
    let title: String
    let content: String
}
