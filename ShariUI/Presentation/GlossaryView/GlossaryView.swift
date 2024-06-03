//
//  GlossaryView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/3/24.
//

import SwiftUI

struct GlossaryView: View {
    private let viewModel: (any GlossaryViewModel)!
    
    @State var searchKeyword: String
    
    var body: some View {
        VStack {
            SearchBar(text: $searchKeyword)
                .padding()
            
            List {
                ForEach(viewModel.glossaryListItems.filter { $0.content.hasPrefix(searchKeyword) || searchKeyword == "" }, id: \.self) { item in
                    Text(item.content)
                }
            }
            .listStyle(.plain)
            .padding()
        }
        .padding()
    }
    
    init(viewModel: (any GlossaryViewModel)) {
        self.viewModel = viewModel
        self.searchKeyword = ""
        Task {
            await viewModel.loadGlossaryListItems()
        }
    }
}
