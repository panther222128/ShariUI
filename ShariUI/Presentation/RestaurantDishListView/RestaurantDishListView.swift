//
//  RestaurantDishListView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/3/24.
//

import SwiftUI

struct RestaurantDishListView: View {
    
    @State private var showingCameraAlert = false
    @State private var showingDishAlert = false
    @State private var dishName = ""
    
    var body: some View {
        List {
            
        }
        .toolbar {
            Button {
                showingCameraAlert = true
            } label: {
                Image(systemName: "plus")
            }
            .alert("음식 이름", isPresented: $showingCameraAlert) {
                TextField(dishName, text: $dishName)
                Button("취소") {
                    
                }
                Button("확인") {
                    
                }
            }
            
            Button {
                showingDishAlert = true
            } label: {
                Image(systemName: "camera")
            }
            .alert("음식 이름", isPresented: $showingDishAlert) {
                TextField(dishName, text: $dishName)
                Button("취소") {
                    
                }
                Button("확인") {
                    
                }
            }
        }
        .listStyle(.plain)
    }
    
}
