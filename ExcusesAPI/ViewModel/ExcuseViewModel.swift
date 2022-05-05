//
//  ExcuseViewModel.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import Foundation
import SwiftUI

class ExcuseViewModel: ObservableObject {
    @Published var excuse = [Excuse]()
    private var desiredCategory: Category = .familyy
    @Published var excuseLoaded = false
    
    func setCategory(category: Category) {
        desiredCategory = category
    }
    
    func getData() {
        guard let url = URL(string: "https://excuser.herokuapp.com/v1/excuse/\(desiredCategory.title)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let tempExcuseArray = try JSONDecoder().decode([Excuse].self, from: data)
                self.excuse = tempExcuseArray
                
                self.excuseLoaded = true
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    func clearData() {
        excuse.removeAll(keepingCapacity: false)
        excuseLoaded = false
    }
    
    
}
