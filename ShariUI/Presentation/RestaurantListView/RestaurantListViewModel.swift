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
    func didSelectItem(restaurant: RestaurantListItemViewModel) -> RestaurantDishListView?
}

struct RestaurantListViewModelActions {
    let showRestaurantDishListView: (_ restaurant: Restaurant) -> RestaurantDishListView
}

@Observable
final class DefaultRestaurantListViewModel: RestaurantListViewModel {
    
    private let repository: ReviewListRepository
    private let actions: RestaurantListViewModelActions
    
    private var restaurants: [Restaurant]
    private(set) var listItems: [RestaurantListItemViewModel]
    
    init(repository: ReviewListRepository, actions: RestaurantListViewModelActions) {
        self.repository = repository
        self.actions = actions
        self.restaurants = []
        self.listItems = []
    }
    
    func loadListItems() async throws {
        let domain = try await repository.fetchRestaurants()
        restaurants = domain
        listItems = domain.map { .init(id: $0.id, restaurantName: $0.name, date: $0.date) }
    }
    
    func didSelectItem(restaurant: RestaurantListItemViewModel) -> RestaurantDishListView? {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            let restaurant = restaurants[index]
            return actions.showRestaurantDishListView(restaurant)
        } else {
            return nil
        }
    }
    
}
