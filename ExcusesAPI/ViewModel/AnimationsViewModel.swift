//
//  AnimationsViewModel.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import Foundation
import SwiftUI

class AnimationsViewModel: ObservableObject {
    @Published var header1 = false
    @Published var header2 = false
    @Published var main = false
    @Published var categories = false
    
    @Published var mainViewGoBackAnimation = false
    
    init() {
        startAnimating()
    }
    
    
    func startAnimating() {
        withAnimation(.easeInOut) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.header1.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.header2.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.main.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.categories.toggle()
                        }
                    }
                }
            }
        }
    }
    
    func mainViewAppeared() {
        withAnimation(.easeInOut(duration: 1)) {
            mainViewGoBackAnimation = true
        }
    }
    func mainViewDisappeared() {
        withAnimation(.easeInOut(duration: 1)) {
            mainViewGoBackAnimation = false
        }
    }
    
}
