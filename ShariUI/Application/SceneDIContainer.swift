//
//  SceneDIContainer.swift
//  ShariUI
//
//  Created by Horus on 5/30/24.
//

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
    private func makeRestaurantListViewModel(actions: RestaurantListViewModelActions) -> RestaurantListViewModel {
        return DefaultRestaurantListViewModel(repository: makeReviewListRepository(), actions: actions)
    }
    
    @MainActor
    func makeRestaurantListView(actions: RestaurantListViewModelActions) -> RestaurantListView {
        return RestaurantListView(viewModel: makeRestaurantListViewModel(actions: actions))
    }
    
    @MainActor
    private func makeGlossaryViewModel() -> GlossaryViewModel {
        return DefaultGlossaryViewModel()
    }
    
    @MainActor
    func makeGlossaryView() -> GlossaryView {
        return GlossaryView(viewModel: makeGlossaryViewModel())
    }
    
    @MainActor
    func makeSettingsView() -> SettingsView {
        return SettingsView()
    }
    
    @MainActor
    func makeRestaurantDishListView() -> RestaurantDishListView {
        return RestaurantDishListView()
    }
    
    @MainActor
    func makeStudioView() -> StudioView {
        return StudioView()
    }
    
}
