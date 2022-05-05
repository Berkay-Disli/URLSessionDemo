//
//  CategoryButtons.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import SwiftUI

struct CategoryButtons: View {
    let categoryName: String
    var body: some View {
        Text(categoryName)
            .font(.title3).bold()
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(LinearGradient(colors: [Color("pink"), Color("blue")], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(70)
            .shadow(color: Color("pink").opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

struct CategoryButtons_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtons(categoryName: "FAMILY")
    }
}
