//
//  DishDetailView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/4/24.
//

import SwiftUI

struct DishDetailView: View {
    
    @State private var showingAlert: Bool = false
    @State private var name = ""
    private let viewModel: (any DishDetailViewModel)!
    
    var body: some View {
        ScrollView(.vertical) {
            Image(uiImage: UIImage(data: viewModel.thumbnailImageData ?? Data()) ?? UIImage())
            VStack {
                ForEach(viewModel.tasteItems) { taste in
                    Text(taste.taste)
                }
            }
            .padding()
        }
        .toolbar {
            Button {
                showingAlert = true
            } label: {
                Image(systemName: "plus")
            }
            .alert("음식 이름", isPresented: $showingAlert) {
                TextField(name, text: $name)
                Button("취소") {
                    
                }
                Button("확인") {
                    
                }
            }
        }
    }
    
}
