//
//  RegisterBaseView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/27/24.
//

import SwiftUI
import Combine

struct RegisterBaseView: View {
    
    @Environment(\.dismiss) private var isDismiss
//    @Environment(\.scrollDismissesKeyboardMode) private var isKeyboardDismiss
    
    let route: Router
    
    @State private var inputName: String = ""
    @State private var inputPhoneNumber: String = ""
    @State private var inputEmail: String = ""
    @FocusState private var isFieldFocused: Bool
    @State private var placeholderColor: Color = .gray
    
    @State private var isAllAgree: Bool = false {
        didSet {
            allAgreeAction()
        }
    }
    @State private var isInformationAgree: Bool = false
    @State private var isEmailAgree: Bool = false
    
    @State private var sementSeledted = 0
    private let allSubject =  PassthroughSubject<Bool,Never>()
    
    var attributedString: AttributedString {
        var attributedString = AttributedString("최애적금 을 찾아 주셔서 감사합니다.\n상품을 가입하시고 본인이 원하는 대로 적금을 입금해주세요.")
        
        // "Hello," 부분에 스타일 적용
        if let range = attributedString.range(of: "최애적금") {
            attributedString[range].foregroundColor = .black
            attributedString[range].font = .system(size: 20,weight: .bold)
        }
        
        // "SwiftUI!" 부분에 스타일 적용
        if let range = attributedString.range(of: "원하는") {
            attributedString[range].foregroundColor = .blue
            attributedString[range].font = .system(size: 18, weight: .bold)
            attributedString[range].underlineStyle = .single
        }
        
        return attributedString
    }
    
    private func descriptionTextView(comment: String) -> some View {
        HStack {
            Text(comment)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.black.opacity(0.8))
                .padding(6)
                .padding(.leading,8)
            Spacer()
        }
    }
    
    var body: some View {
        ScrollView(.vertical)  {
            VStack(spacing: 5,
                   content: {
                descriptionTextView(comment: "상품가입을 위해서 필요한 정보를 저장해 주세요")
                
                RoundInputField(
                    isFocused: $isFieldFocused,
                    textValue: $inputName,
                    promptColor: $placeholderColor,
                    promptText: "이름을 입력해 주세요"
                )
                
                RoundInputField(
                    isFocused: $isFieldFocused,
                    textValue: $inputPhoneNumber,
                    promptColor: $placeholderColor,
                    promptText: "전화번호를 입력해 주세요"
                )
                
                VStack(spacing: 10, content: {
                    descriptionTextView(comment: "광고 수신을 위해서 동의해 주세요.")
                })
                    
                
                VStack {
                    CheckBoxBase(
                        checkValue:$isAllAgree,
                        valueSubject: allSubject,
                        titleFont: Font.system(size: 18,weight: .semibold),
                        titleText: "모두 동의"
                    ).onReceive(allSubject, perform: { newValue in
                        if newValue == true {
                            isEmailAgree = true
                            isInformationAgree = true
                        } else {
                            isEmailAgree = false
                            isInformationAgree = false
                        }
                    })
                    
                    Group {
                        if #available(iOS 17.0, *) {
                            CheckBoxBase(
                                checkValue:$isInformationAgree,
                                titleFont: Font.system(size: 14,weight: .semibold),
                                titleText: "사용자 정보 수집에 동의 합니다.",
                                boxSize: .medium
                            )
                            .onChange(of: isInformationAgree) { oldValue, newValue in
                                print("values",oldValue,newValue)
                            }
                        } else {
                            
                        }
                        CheckBoxBase(
                            checkValue:$isEmailAgree,
                            titleFont: Font.system(size: 14,weight: .semibold),
                            titleText: "광고성 Email 수신에 동의 합니다.",
                            boxSize: .medium
                        )
                    }
                    .padding(.leading, 10).padding(.top,5)
                }
                .padding([.top,.bottom],20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.gray.opacity(0.1))
                        
                )
                
                if isEmailAgree {
                    RoundInputField(
                        isFocused: $isFieldFocused,
                        textValue: $inputEmail,
                        promptColor: $placeholderColor,
                        promptText: "Email을 입력해 주세요"
                    )
                    .padding(.top,10)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1), value: isEmailAgree)
                }
                VStack {
                    Text(attributedString)
                        .truncationMode(.tail)
                }.padding(.top, 20)
                Spacer().frame(height: 200)
                Button {
                    if inputName.isEmpty || inputPhoneNumber.isEmpty || inputEmail.isEmpty {
                        placeholderColor = .red
                    } else {
                        placeholderColor = .gray
                    }
                    isFieldFocused = false
                } label: {
                    Text("가입하기")
                        .foregroundStyle(.black)
                        .font(.system(size: 17,weight: .semibold))
                        .padding([.leading,.trailing],20)
                        .padding([.top,.bottom],8)
                        .frame(minWidth: 100)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                SegmentPickerView(selectedSegment: $sementSeledted, segments: ["집","직장","직접입력"])
            })
            .padding([.leading,.trailing],20)
            .onTapGesture {
                isFieldFocused = false
            }
        }
        .navigationTitle(route.title)
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement:.topBarLeading) {
                Button {
                    isDismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.black)
                        .buttonStyle(PlainButtonStyle())
                }

            }
        })
    }
    
    private func allAgreeAction() {
        if isAllAgree {
            isEmailAgree = true
            isInformationAgree = true
        } else {
            isEmailAgree = false
            isInformationAgree = false
        }
    }
}

#Preview {
    RegisterBaseView(route: .registerBase)
}
