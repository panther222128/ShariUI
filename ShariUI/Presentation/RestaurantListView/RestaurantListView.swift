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
                viewModel.didSelectItem(restaurant: item)?
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.didDeleteRestaurant(restaurantId: item.id)
                        } label: {
                            Text("삭제")
                        }
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
                viewModel.didConfirm(restaurantName: name)
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
