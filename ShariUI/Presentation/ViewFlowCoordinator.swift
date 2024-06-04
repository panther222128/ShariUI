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
}

// MARK: - NavigationStack
struct ViewFlowCoordinator: View {
    
    private let dependencies: ViewFlowCoordinatorDependencies
    
    init(dependencies: ViewFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                dependencies.makeRestaurantListView(actions: .init(showRestaurantDishListView: showRestaurantDishListView(restaurant:)))
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
    
    private func showRestaurantDishListView(restaurant: Restaurant) -> NavigationLink<VStack<TupleView<(Text, Text)>>, RestaurantDishListView> {
        return NavigationLink(destination: dependencies.makeRestaurantDishListView()) {
            VStack {
                Text(restaurant.name)
                Text(restaurant.date.formatYearMonthDate())
            }
        }
    }
    
}
