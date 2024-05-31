//
//  RestaurantListViewModel.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

@MainActor
protocol RestaurantListViewModel {
    
}

@Observable
final class DefaultRestaurantListViewModel: RestaurantListViewModel {
    
    private let repository: ReviewListRepository
    
    init(repository: ReviewListRepository) {
        self.repository = repository
    }
    
}
