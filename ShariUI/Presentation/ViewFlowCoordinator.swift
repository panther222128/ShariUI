//
//  ViewFlowCoordinator.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import Foundation

protocol ViewFlowCoordinatorDependencies {
    func makeRestaurantListView() -> RestaurantListView
    func makeGlossaryView() -> GlossaryView
    func makeSettingsView() -> SettingsView
}

final class ViewFlowCoordinator {
    
    private let dependencies: ViewFlowCoordinatorDependencies
    
    init(dependencies: ViewFlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> ContainerView {
        return ContainerView(viewFlowCoordinator: self)
    }
    
    func makeRestaurantListView() -> RestaurantListView {
        return dependencies.makeRestaurantListView()
    }
    
    func makeGlossaryView() -> GlossaryView {
        return dependencies.makeGlossaryView()
    }
    
    func makeSettingsView() -> SettingsView {
        return dependencies.makeSettingsView()
    }
    
}
