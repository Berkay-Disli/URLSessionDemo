//
//  ExcuseBar.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import SwiftUI

struct ExcuseBar: View {
    @ObservedObject var excuseViewModel: ExcuseViewModel
    let category: String
    let excuse: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(category.uppercased())
                .font(.title2).bold()
                
            Text(excuse)
                .font(.title3)
                .padding(.horizontal)
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width - 30)
        .padding(.vertical)
        .background(LinearGradient(colors: [Color("pink"), Color("blue")], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct ExcuseBar_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseBar(excuseViewModel: ExcuseViewModel(), category: "Family", excuse: "Something hajksdllasdkhajdsıjakhjdkadjsjkjlk")
    }
}
