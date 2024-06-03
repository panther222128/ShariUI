//
//  ViewFlowCoordinator.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

protocol ViewFlowCoordinatorDependencies {
    func makeRestaurantListView(actions: RestaurantListViewModelActions) -> RestaurantListView
    func makeGlossaryView() -> GlossaryView
    func makeSettingsView() -> SettingsView
    
    func makeRestaurantDishListView() -> RestaurantDishListView
}

// MARK: - NavigationStack
final class ViewFlowCoordinator {
    
    private let dependencies: ViewFlowCoordinatorDependencies
    
    init(dependencies: ViewFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> ContainerView {
        return ContainerView(viewFlowCoordinator: self)
    }
    
    func makeRestaurantListView() -> RestaurantListView {
        let actions: RestaurantListViewModelActions = .init(showRestaurantDishListView: showRestaurantDishListView(restaurant:))
        return dependencies.makeRestaurantListView(actions: actions)
    }
    
    func makeGlossaryView() -> GlossaryView {
        return dependencies.makeGlossaryView()
    }
    
    func makeSettingsView() -> SettingsView {
        return dependencies.makeSettingsView()
    }
    
    private func showRestaurantDishListView(restaurant: Restaurant) -> RestaurantDishListView {
        return dependencies.makeRestaurantDishListView()
    }
    
}
