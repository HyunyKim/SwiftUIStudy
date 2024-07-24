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
    case alarm
    case drag
    case drag2
    case chatUI
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
        case .alarm:
            AlarmMainView(route: self, viewModel:AlarmViewModel())
        case .drag:
            Gesture1View()
        case .drag2:
            Gesture2View()
        case .chatUI:
            ChatBaseView()
        }
    }
    
    var title: String {
        switch self {
        case .goods: "상품상세"
        case .registerBase: "사용자입력 기본"
        case .list: "리스트 심화"
        case .alarm: "알림"
        case .drag: "드레그"
        case .drag2: "드레그2"
        case .chatUI: "채팅"
        }
    }
}

extension Router {
    
    static func == (lhs: Router, rhs: Router) -> Bool {
        switch (lhs,rhs) {
        case (.goods, .goods),
            (.registerBase,.registerBase),
            (.list,.list),
            (.alarm,.alarm),
            (.drag,.drag),
            (.drag2,.drag2),
            (.chatUI,.chatUI):
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
        case .alarm:
            hasher.combine(3)
        case .drag:
            hasher.combine(4)
        case .drag2:
            hasher.combine(5)
        case .chatUI:
            hasher.combine(6)
        }
    }
}


//1.    고유한 해시 값 생성: combine 메서드는 해시 값을 고유하게 만듭니다. 각 case에 대해 다른 정수를 결합하여 서로 다른 해시 값을 생성할 수 있습니다. 이렇게 하면 동일한 열거형 값은 항상 동일한 해시 값을 갖고, 다른 열거형 값은 서로 다른 해시 값을 갖도록 보장할 수 있습니다.
//2.    효율성: Hasher 객체의 combine 메서드는 해시 값을 효율적으로 계산하도록 설계되었습니다. 내부적으로 combine 메서드는 제공된 값을 해시 값에 안전하게 결합하는 최적화된 알고리즘을 사용합니다.
//3.    Swift 표준 준수: Swift 표준 라이브러리는 Hashable을 준수하는 객체가 hash(into:) 메서드를 통해 해시 값을 계산할 때 combine 메서드를 사용하도록 권장합니다. 이는 코드의 일관성을 유지하고 Swift 표준 라이브러리와의 호환성을 보장합니다.
//
//따라서 Router 열거형의 각 case를 식별하는 정수 값을 combine 메서드를 통해 Hasher에 결합하여 해시 값을 생성하는 것이 좋습니다.

//이렇게 하면 Router 열거형의 각 case가 해시 테이블에서 고유하게 식별될 수 있으며, Swift의 표준을 준수하는 효율적이고 일관된 해시 값을 생성할 수 있습니다.
