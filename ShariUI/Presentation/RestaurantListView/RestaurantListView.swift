//
//  RestaurantListView.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

struct RestaurantListView: View {
    
    private let viewModel: (any RestaurantListViewModel)!
    
    var body: some View {
        List {
            
        }
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "plus")
            }
        }
    }
    
    init(viewModel: (any RestaurantListViewModel)) {
        self.viewModel = viewModel
    }
    
}
