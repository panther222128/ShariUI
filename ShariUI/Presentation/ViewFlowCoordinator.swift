//
//  ViewFlowCoordinator.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

protocol ViewFlowCoordinatorDependencies {
    func makeRestaurantListView(actions: RestaurantListViewModelActions) -> RestaurantListView
    func makeGlossaryView() -> GlossaryView
    func makeSettingsView() -> SettingsView
    
    func makeRestaurantDishListView() -> RestaurantDishListView
    func makeStudioView() -> StudioView
}

// MARK: - NavigationStack
struct ViewFlowCoordinator: View {
    
    private let dependencies: ViewFlowCoordinatorDependencies
    
    init(dependencies: ViewFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                makeRestaurantListView()
            }
            .tabItem {
                Label("오마카세", systemImage: "list.bullet")
            }
            
            dependencies.makeGlossaryView()
                .tabItem {
                    Label("용어사전", systemImage: "book.closed")
                }
            
            dependencies.makeSettingsView()
                .tabItem {
                    Label("설정", systemImage: "gear")
                }
        }
    }

    private func makeRestaurantListView() -> RestaurantListView {
        let actions: RestaurantListViewModelActions = .init(showStudioView: showStudioView(restaurantId:restaurantName:), showRestaurantDishListView: showRestaurantDishListView(restaurant:))
        return dependencies.makeRestaurantListView(actions: actions)
    }

    private func showRestaurantDishListView(restaurant: Restaurant) -> RestaurantDishListView {
        return dependencies.makeRestaurantDishListView()
    }
    
    private func showStudioView(restaurantId: String, restaurantName: String) -> StudioView {
        return dependencies.makeStudioView()
    }
    
}
