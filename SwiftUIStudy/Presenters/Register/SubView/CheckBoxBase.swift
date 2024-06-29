//
//  CheckBoxBase.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/29/24.
//

import SwiftUI
import Combine

struct CheckBoxBase: View {
    enum CheckBoxSize: CGFloat {
        case small = 12
        case medium = 18
        case large = 24
    }
    
    @Binding var checkValue: Bool
    
    var valueSubject: PassthroughSubject<Bool,Never>?
    
    var titleFont: Font
    var titleText: String = "원하는 타이틀"
    var titleColor: Color = .black.opacity(0.8)
    var boxSize: CheckBoxSize = .large
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    checkValue.toggle()
                }
                valueSubject?.send(checkValue)
            } label: {
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: boxSize.rawValue, height: boxSize.rawValue)
                    .foregroundStyle(checkValue ? .yellow : .gray.opacity(0.5))
                    .clipShape(Circle())
                Text(titleText)
                    .font(titleFont)
                    .foregroundStyle(.black.opacity(0.8))
            }.buttonStyle(PlainButtonStyle())
            .padding(.leading, 24)
            Spacer()
         
        }
    }
}

#Preview {
    CheckBoxBase(
        checkValue:.constant(false),
        valueSubject: (PassthroughSubject<Bool, Never>()),
        titleFont: Font.system(size: 18, weight: .semibold)
    )
}
