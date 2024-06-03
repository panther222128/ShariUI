//
//  SceneDIContainer.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

import SwiftUI
import SwiftData

final class SceneDIContainer: ViewFlowCoordinatorDependencies {
    
    struct Dependencies {
        let fileGenerator: FileGenerator
    }
    
    private let dependencies: Dependencies
    
    lazy var reviewListStorage: ReviewListStorage = DefaultReviewListStorage()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeViewFlowCoordinator() -> ViewFlowCoordinator {
        return ViewFlowCoordinator(dependencies: self)
    }
    
    private func makeReviewListRepository() -> ReviewListRepository {
        return DefaultReviewListRepository(storage: reviewListStorage, fileGenerator: dependencies.fileGenerator)
    }
    
    @MainActor
    private func makeRestaurantListViewModel() -> RestaurantListViewModel {
        return DefaultRestaurantListViewModel(repository: makeReviewListRepository())
    }
    
    @MainActor
    func makeRestaurantListView() -> RestaurantListView {
        return RestaurantListView(viewModel: makeRestaurantListViewModel())
    }
    
    @MainActor
    func makeGlossaryView() -> GlossaryView {
        return GlossaryView()
    }
    
    @MainActor
    func makeSettingsView() -> SettingsView {
        return SettingsView()
    }
    
}
