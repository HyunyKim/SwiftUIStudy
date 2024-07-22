//
//  AlarmViewModel.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/12/24.
//

import Foundation
import SwiftUI

final class AlarmViewModel: ObservableObject {
    @Published var alarmList: [AlarmModel] = []
    init() {}
    
    func requestList() async {
        let list = await makeList()
        await MainActor.run {
            self.alarmList = list
        }
    }
    
    private func makeList() async -> [AlarmModel] {
        var list = [AlarmModel]()
        for  index in 0..<100 {
            list.append(AlarmModel(type: .event, title: "title index - \(index)", content: "모임통장에서 받은금액", subContent: makeSubList() , expended: false))
        }
        return list
    }
    
    private func makeSubList() -> [String] {
        var list = [String]()
        for index in 0..<5 {
            list.append("subindex - \(index)")
        }
        return list
    }
}
