//
//  RestaurantListView.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

struct RestaurantListView: View {
    
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
                
            } label: {
                Image(systemName: "plus")
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
