//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Zach Uptin on 27/9/2022.
//

import SwiftUI

struct AFButton: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(text: "Learn More")
    }
}
