//
//  RestaurantListView.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State private var showingAlert = false
    @State private var name = ""
    private var viewModel: (any RestaurantListViewModel)!
    
    var body: some View {
        List {
            ForEach(viewModel.listItems) { item in
                VStack {
                    Text(item.restaurantName)
                    Text(item.date.formatYearMonthDate())
                }
            }
        }
        .toolbar {
            Button {
                showingAlert = true
            } label: {
                Image(systemName: "plus")
            }
            .alert("오마카세 이름", isPresented: $showingAlert) {
                TextField(name, text: $name)
                Button("취소") {
                    
                }
                Button("확인") {
                    
                }
            }
        }
        .listStyle(.plain)
    }
    
    init(viewModel: (any RestaurantListViewModel)) {
        self.viewModel = viewModel
        Task {
            try await viewModel.loadListItems()
        }
    }
    
}
