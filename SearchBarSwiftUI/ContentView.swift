//
//  ContentView.swift
//  SearchBarSwiftUI
//
//  Created by Sören Kirchner on 30.01.21.
//

import SwiftUI

struct FruitsView: View {
    
    @ObservedObject var  fruitsController = FruitsController()
    @State var searchFieldValue = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchFieldValue)
                .padding()
                .onChange(of: searchFieldValue) { value in
                    fruitsController.search(for: value)
                }
            List (fruitsController.publishedFruits) { fruit in
                Text(fruit.name)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        FruitsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
