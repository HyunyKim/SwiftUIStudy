//
//  ListSampleView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/7/24.
//

import SwiftUI

struct Person: Identifiable{
    let id = UUID()
    let name: String
    let phone: String
}

struct ListSampleView: View {
    
    let items: [Person] = [
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
    ]
    
    let listItems: [String] = ["Normal"]
    
    
    let route: Router
    var body: some View {
        List(listItems, id: \.self) { item in
            NavigationLink {
                NormalView(items: items)
            } label: {
                Text(item)
            }

            
        }
    }
}

#Preview {
    NavigationView(content: {
        ListSampleView(route: .list)
    })
}
