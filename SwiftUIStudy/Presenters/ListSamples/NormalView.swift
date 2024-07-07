//
//  NormalView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/7/24.
//

import SwiftUI

struct NormalView: View {
    
    @Environment(\.dismiss) private var isDismiss
    
    var items: [Person]
    @State var searchWord: String = ""
    var body: some View {
        List() {
            ForEach(items.filter({
                guard searchWord.count > 0 else { return true }
                //                return $0.name.contains(searchWord)
                //                return $0.name.lowercased().contains(searchWord.lowercased())
                return $0.name.localizedStandardContains(searchWord)
                //메서드는 대소문자를 구분하지 않고 문자열을 비교하며, 로케일에 맞게 문자열 비교를 수행함
            })) { item in
                Text(item.name)
            }
        }
        .navigationTitle("normal")
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
        .searchable(
            text: $searchWord,
            placement:.navigationBarDrawer(displayMode: .always), prompt: promptView()
            
//            suggestions: {
//                ScrollView {
//                    VStack(spacing: 2, content: {
//                        ForEach(items) { item in
//                            Button {
//                                searchWord = item.name
//                            } label: {
//                                HStack {
//                                    Text(item.name)
//                                }
//                            }
//
//                        }
//                    })
//                }
//            }
        )
        .onChange(of: searchWord, perform: { value in
            print(value)
        })
    }
    
    private func promptView() -> Text{
        return Text("검색어를 입력하세요")
    }
}

#Preview {
    NavigationView(content: {
        NormalView(items: [
            Person(name: "Apple", phone: "010-1929-1929"),
            Person(name: "Banana", phone: "010-1929-1929"),
            Person(name: "City", phone: "010-1929-1929"),
            Person(name: "Dream", phone: "010-1929-1929"),
            Person(name: "Everybody", phone: "010-1929-1929"),
            Person(name: "Family", phone: "010-1929-1929"),
            Person(name: "Good", phone: "010-1929-1929"),
            Person(name: "Happy", phone: "010-1929-1929"),
            Person(name: "IceCream", phone: "010-1929-1929"),
            Person(name: "Justice", phone: "010-1929-1929"),
            Person(name: "Kiss", phone: "010-1929-1929"),
            Person(name: "Love", phone: "010-1929-1929"),
            Person(name: "Mountain", phone: "010-1929-1929"),
            Person(name: "Normal", phone: "010-1929-1929"),
            Person(name: "Over", phone: "010-1929-1929"),
            Person(name: "People", phone: "010-1929-1929"),
            Person(name: "Quick", phone: "010-1929-1929"),
            Person(name: "Reload", phone: "010-1929-1929"),
            Person(name: "Shooting", phone: "010-1929-1929"),
            Person(name: "The", phone: "010-1929-1929"),
            Person(name: "Univers", phone: "010-1929-1929"),
            Person(name: "Velocity", phone: "010-1929-1929"),
            Person(name: "Wow", phone: "010-1929-1929"),
            Person(name: "Xmas", phone: "010-1929-1929"),
            Person(name: "Yello", phone: "010-1929-1929"),
            Person(name: "Zootopia", phone: "010-1929-1929"),
        ])
        
    })
}
