//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Zach Uptin on 6/10/2022.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
            
            HStack(spacing: 40) {
                VStack (spacing: 5) {
                    Text("Calories")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                
                VStack (spacing: 5) {
                    Text("Carbs")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.carbs)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                
                VStack (spacing: 5) {
                    Text("Protein")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.protein)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            
            Spacer()
            
            Button {
                print("Hello")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
  
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}