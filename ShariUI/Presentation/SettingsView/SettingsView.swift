//
//  SettingsView.swift
//  ShariUI
//
//  Created by Jun Ho JANG on 6/3/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        Toggle("삭제 시 확인 묻기", isOn: $isOn)
            .onChange(of: isOn) { oldValue, newValue in
                if newValue {
                    
                } else {
                    
                }
            }
    }
    
}
