//
//  AlarmMainView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/11/24.
//

import SwiftUI

struct ListItemView: View {
    var item : AlarmModel
    @State private var isExpend: Bool = false
    
    var body: some View {
        VStack(spacing: 5, content: {
            HStack(spacing: 0, content: {
                Text(item.title)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.trailing, 10)
                Text(item.content)
                    .font(.system(size: 12, weight: .regular))
                Spacer()
            })
            HStack(spacing: 0, content: {
                VStack(alignment:.leading, spacing: 2, content: {
                    ForEach(item.subContent, id: \.self) { subItem in
                        Text(subItem)
                            .font(.system(size: 10, weight: .semibold))
                    }
                })
                Spacer()
            })
            .frame(maxHeight: isExpend ? 80 : 0)
            .clipped(antialiased: true)
            
            Text("")
            Rectangle()
                .frame(height: 0.5)
                .foregroundStyle(.gray)
        })
        .frame(minHeight: 40)
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.2)) {
                isExpend.toggle()
            }
        }
    }
}


struct AlarmMainView: View {
    @Environment(\.dismiss) private var isDismiss

    let route: Router
    @StateObject var viewModel: AlarmViewModel
    var body: some View {
        ScrollView(.vertical, content: {
            LazyVStack(content: {
                ForEach(viewModel.alarmList, id: \.id) { item in
                    ListItemView(item: item)
                        .padding([.leading,.trailing],16)
                        .transition(.slide)
                }
            })
        })
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                CustomNavigationView(navigationType: .back ,leftButtonAction: {
                    isDismiss()
                }, titleString: "알림")
            }
        }
        .onAppear() {
            Task() {
                await viewModel.requestList()
            }
        }
    }
}

#Preview {
    NavigationView(content: {
        AlarmMainView(route: .alarm, viewModel: AlarmViewModel())
    })
}
