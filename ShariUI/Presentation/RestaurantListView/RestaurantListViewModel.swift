//
//  RestaurantListViewModel.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

@MainActor
protocol RestaurantListViewModel {
    var listItems: [RestaurantListItemViewModel] { get }
    
    func loadListItems() async throws
}

@Observable
final class DefaultRestaurantListViewModel: RestaurantListViewModel {
    
    private let repository: ReviewListRepository
    
    private(set) var listItems: [RestaurantListItemViewModel]
    
    init(repository: ReviewListRepository) {
        self.repository = repository
        self.listItems = []
    }
    
    func loadListItems() async throws {
        let domain = try await repository.fetchRestaurants()
        listItems = domain.map { .init(id: $0.id, restaurantName: $0.name, date: $0.date) }
    }
    
}
