//
//  RestaurantListViewModel.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

@MainActor
protocol RestaurantListViewModel {
    var listItems: [RestaurantListItemViewModel] { get }
    
    func loadListItems() async throws
    func didAddRestaurant(name: String)
    func didDeleteRestaurant(restaurantId: String)
    func didSelectItem(restaurant: RestaurantListItemViewModel) -> RestaurantDishListView?
    func didConfirm(restaurantName: String) -> StudioView
}

struct RestaurantListViewModelActions {
    let showStudioView: (_ restaurantId: String, _ restaurantName: String) -> StudioView
    let showRestaurantDishListView: (_ restaurant: Restaurant) -> RestaurantDishListView?
}

@Observable
final class DefaultRestaurantListViewModel: RestaurantListViewModel {
    
    private let repository: ReviewListRepository
    private let actions: RestaurantListViewModelActions
    
    private var restaurants: [Restaurant]
    private var restaurantId: String
    private(set) var listItems: [RestaurantListItemViewModel]
    
    init(repository: ReviewListRepository, actions: RestaurantListViewModelActions) {
        self.repository = repository
        self.actions = actions
        self.restaurants = []
        self.restaurantId = ""
        self.listItems = []
    }
    
    func didConfirm(restaurantName: String) -> StudioView {
        return actions.showStudioView(restaurantId, restaurantName)
    }
    
    func didAddRestaurant(name: String) {
        let id = UUID().uuidString
        restaurantId = id
        repository.saveRestaurant(restaurantId: id, name: name)
    }
    
    func didDeleteRestaurant(restaurantId: String) {
        repository.deleteRestaurant(restaurantId: restaurantId)
        if let index = restaurants.firstIndex(where: { $0.id == restaurantId }) {
            restaurants.remove(at: index)
        } else {
            
        }
    }

    func loadListItems() async throws {
        let domain = try await repository.fetchRestaurants()
        restaurants = domain
        listItems = restaurants.map { .init(id: $0.id, restaurantName: $0.name, date: $0.date) }
    }
    
    func didSelectItem(restaurant: RestaurantListItemViewModel) -> RestaurantDishListView? {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            return actions.showRestaurantDishListView(restaurants[index])
        } else {
            return nil
        }
    }
    
}
