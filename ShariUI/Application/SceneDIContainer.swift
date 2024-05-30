//
//  SceneDIContainer.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI

final class SceneDIContainer: ViewFlowCoordinatorDependencies {
    
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeViewFlowCoordinator() -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self)
    }
    
    @MainActor
    private func makeRestaurantListViewModel() -> RestaurantListViewModel {
        return DefaultRestaurantListViewModel()
    }
    
    @MainActor
    func makeRestaurantListView() -> RestaurantListView {
        return RestaurantListView(viewModel: makeRestaurantListViewModel())
    }
    
}
