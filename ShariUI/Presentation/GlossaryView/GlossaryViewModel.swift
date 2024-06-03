//
//  GlossaryViewModel.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/3/24.
//

import Foundation

@MainActor
protocol GlossaryViewModel {
    var glossaryListItems: [GlossaryListItemViewModel] { get }
    
    func loadGlossaryListItems()
}

@Observable
final class DefaultGlossaryViewModel: GlossaryViewModel {
    
    private let glossaryContents: [String]
    private(set) var glossaryListItems: [GlossaryListItemViewModel]
    
    init() {
        self.glossaryContents = Constants.glossaryContents
        self.glossaryListItems = []
    }
    
    func loadGlossaryListItems() {
        glossaryListItems = glossaryContents.map { .init(content: $0) }
    }
    
}
