//
//  Router.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/27/24.
//

import Foundation
import SwiftUI

enum Router: Hashable, Identifiable {
    case goods
    case registerBase
    case list
    
    var id: UUID {
        switch self {
        default:
            UUID()
        }
    }
    
    /// ViewBuilder는 특정 View가 아닌 다양한 뷰를 반환할 수 있도록 해줍니다.
    /// 함수가 아닌 프로퍼티가 뷰를 적용할때 사용되어져야 한다. 
    @ViewBuilder
    var view: some View {
        switch self {
        case .goods:
            GoodDetailView()
        case .registerBase:
            RegisterBaseView(route: self)
        case .list:
            ListSampleView(route: self)
        }
    }
    
    var title: String {
        switch self {
        case .goods: "상품상세"
        case .registerBase: "사용자입력 기본"
        case .list: "리스트 심화"
        }
    }
}

extension Router {
    
    static func == (lhs: Router, rhs: Router) -> Bool {
        switch (lhs,rhs) {
        case (.goods, .goods),(.registerBase,.registerBase),(.list,.list):
            return true
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .goods:
            hasher.combine(0)
        case .registerBase:
            hasher.combine(1)
        case .list:
            hasher.combine(2)
        }
    }
}
