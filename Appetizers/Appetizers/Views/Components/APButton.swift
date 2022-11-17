//
//  APButton.swift
//  Appetizers
//
//  Created by Zach Uptin on 6/10/2022.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    let color: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 350, height: 50)
            .foregroundColor(.black)
            .background(Color(color))
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title", color: "Light Blue")
    }
}
