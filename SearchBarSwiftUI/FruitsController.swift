//
//  FruitsController.swift
//  SearchBarSwiftUI
//
//  Created by Sören Kirchner on 30.01.21.
//

import Foundation

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

class FruitsController: ObservableObject {
    let fruits = [Fruit(name: "Jackfruit"), Fruit(name: "Apples"), Fruit(name: "Banana"), Fruit(name: "Lemon")]
    @Published var publishedFruits = [Fruit]()
    
    init() {
        publishedFruits = fruits
    }
    
    public func search(for key: String) {
        publishedFruits = fruits.filter {key.isEmpty ? true : $0.name.lowercased().contains(key.lowercased())}
    }
}

