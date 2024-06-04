//
//  DishDetailViewModel.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/4/24.
//

import Foundation

@MainActor
protocol DishDetailViewModel {
    var tasteItems: [TasteItemViewModel] { get }
    var thumbnailImageData: Data? { get }
}

struct TasteItemViewModel: Identifiable {
    let id: String
    let taste: String
}

@Observable
final class DefaultDishDetailViewModel: DishDetailViewModel {
    
    private let repository: ReviewListRepository
    private let restaurantId: String
    private let dishId: String
    private(set) var tasteItems: [TasteItemViewModel]
    private let dishName: String
    private(set) var thumbnailImageData: Data?
    private let tastesCount: Int
    
    init(repository: ReviewListRepository, restaurantId: String, dish: Dish) {
        self.repository = repository
        self.restaurantId = restaurantId
        self.dishId = dish.id
        self.tasteItems = dish.tastes.map { .init(id: UUID().uuidString, taste: $0) }
        self.dishName = dish.name
        self.thumbnailImageData = dish.thumbnailImageData
        self.tastesCount = dish.tastes.count
    }
    
}
