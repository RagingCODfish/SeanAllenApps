//
//  FramworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Zach Uptin on 27/9/2022.
//

import SwiftUI

struct FramworkDetailView: View {
    
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $isShowingDetailView)

            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(text: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle)
            .tint(.red)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct FramworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FramworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}
