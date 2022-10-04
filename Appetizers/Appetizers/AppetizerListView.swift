//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Zach Uptin on 4/10/2022.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            Text("AppetizerListView")
                .navigationTitle("Appetizers")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
