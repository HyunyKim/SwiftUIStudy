//
//  RegisterBaseView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/27/24.
//

import SwiftUI

struct RegisterBaseView: View {
    
    let route: Router
    
    @State private var inputName: String = ""
    @FocusState private var isNameFieldFocused: Bool
    @State private var placeholderColor: Color = .gray
    
    var attributedString: AttributedString {
        var attributedString = AttributedString("Title: 이거됩니다.")
        
        // "Hello," 부분에 스타일 적용
        if let range = attributedString.range(of: "Title") {
            attributedString[range].foregroundColor = .red
            attributedString[range].font = .largeTitle.bold()
        }
        
        // "SwiftUI!" 부분에 스타일 적용
        if let range = attributedString.range(of: "SwiftUI!") {
            attributedString[range].foregroundColor = .blue
            attributedString[range].font = .title
            attributedString[range].underlineStyle = .single
        }
        
        return attributedString
    }
    
    var body: some View {
        ScrollView(.vertical)  {
            VStack(spacing: 5, content: {
                HStack {
                    Text("사용자 이름 :")
                    TextField(text: $inputName, prompt: placeHolderView(text: "이름을 입력 해주세요")) {}
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 0.5)
                        )
                        .focused($isNameFieldFocused)
                }
                .padding(20)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Spacer()
                
                VStack {
                    Text(attributedString)
                }
                
                
                Button {
                    if inputName.isEmpty {
                        placeholderColor = .red
                    } else {
                        placeholderColor = .gray
                    }
                } label: {
                    Text("저 장")
                        .foregroundStyle(.black)
                        .font(.system(size: 17,weight: .semibold))
                        .padding([.leading,.trailing],20)
                        .padding([.top,.bottom],5)
                        .frame(minWidth: 100)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
            })
            .padding([.leading,.trailing],20)
        }
        .navigationTitle(route.title)
    }
    
    
    
    private func placeHolderView(text: String) -> Text {
        return Text(text)
            .foregroundColor(placeholderColor)
    }
}

#Preview {
    RegisterBaseView(route: .registerBase)
}
