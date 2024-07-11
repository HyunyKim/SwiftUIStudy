//
//  NavigationView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/11/24.
//

import SwiftUI

struct CustomNavigationView: View {
    
    enum NavigationType {
        case back
        case backRight
    }
    
    let navigationHeight: CGFloat = 44.0
    let buttonSize: CGFloat = 60
    var navigationType: NavigationType = .back
    var leftButtonAction: () -> Void = {() in }
    var rightButtonAction: () -> Void = {() in }
    var titleString: String
    var subTitleString: String?
    
    var body: some View {
        VStack(spacing: 0) {
            switch navigationType {
            case .back:
                HStack(spacing: 0) {
                    itemButton(icon: Image(systemName: "chevron.left"), title: "")
                    Spacer()
                        titleView()
                    Spacer().frame(width: buttonSize)
                    Spacer()
                    
                }
            case .backRight:
                HStack(spacing: 0) {
                    itemButton(icon: Image(systemName: "chevron.left"), title: "")
                    Spacer()
                    titleView()
                    .padding(.trailing, buttonSize)
                    Spacer()
                    itemButton(icon: Image(systemName: "chevron.right"), title: "", isLeft: false)
                }
            }
        }
        .frame(height: 44.0)
    }
    
    private func titleView() -> some View{
        return VStack {
                Text(titleString)
                .font(.system(size: 18, weight: .regular))
                if let subString = subTitleString {
                    Text(subString)
                        .font(.system(size: 12, weight: .light))
                        .foregroundStyle(.gray)
                }
        }
    }
    
    
    private func itemButton(icon: Image, title: String, isLeft: Bool = true) -> some View {
        return Button {
            isLeft ? leftButtonAction() : rightButtonAction()
        } label: {
            HStack(spacing: 0) {
                if isLeft {
                    icon.foregroundColor(.black)
                        .padding(.leading, 10)
                    Text(title)
                    Spacer()
                } else {
                    Spacer()
                    Text(title)
                    icon
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                }
            }
            .buttonStyle(.plain)
            .frame(width: buttonSize)
            .frame(height: navigationHeight)
        }
        
    }
}

#Preview {
    NavigationView() {
        CustomNavigationView(
            navigationType:.back,
            leftButtonAction: {
                print("back")
            },rightButtonAction: {
                print("rightButton")
            }, titleString: "TitleString",
            subTitleString: "SubTitle"
        )
    }
}
