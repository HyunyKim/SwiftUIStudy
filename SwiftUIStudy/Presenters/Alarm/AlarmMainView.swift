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
        Form {
            Text("이건 안되느기가")
        }
        Form(content: {
            if viewModel.alarmList != nil {
                List(viewModel.alarmList!) { item in
                    Text("암 것도 없다")
                }
            } else {
                Text("암 것도 없다")
                Text("암 것도 없다")
                Text("암 것도 없다")
                Text("암 것도 없다")
                Button {
                    print("")
                } label: {
                    Text("anjwl")
                }

            }
        })
        
     
        
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
