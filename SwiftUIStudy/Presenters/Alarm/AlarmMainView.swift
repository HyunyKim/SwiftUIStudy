//
//  AlarmMainView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/11/24.
//

import SwiftUI

struct AlarmMainView: View {
    @Environment(\.dismiss) private var isDismiss

    let route: Router
    @StateObject var viewModel: AlarmViewModel
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0, content: {
                Text("")
            })
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                CustomNavigationView(navigationType: .back ,leftButtonAction: {
                    isDismiss()
                }, titleString: "알림")
            }
        }
    }
}

#Preview {
    NavigationView(content: {
        AlarmMainView(route: .alarm, viewModel: AlarmViewModel())
    })
}
