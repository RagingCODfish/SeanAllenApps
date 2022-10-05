//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Zach Uptin on 4/10/2022.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers: [Appetizer] = []
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
