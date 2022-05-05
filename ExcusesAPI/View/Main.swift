//
//  Main.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import SwiftUI

struct Main: View {
    @ObservedObject var excuseViewModel: ExcuseViewModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var animVM: AnimationsViewModel
    
    let desiredCategory: Category
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("pink").opacity(0.1), Color("blue").opacity(0.1)], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        // clear excuse and set loaded to false function
                        excuseViewModel.clearData()
                        dismiss()
                        animVM.mainViewDisappeared()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Categories")
                                .padding(.vertical)
                        }
                        .foregroundColor(.black.opacity(0.85))
                        .offset(x: animVM.mainViewGoBackAnimation ? 0:70, y: 0)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .onAppear {
                animVM.mainViewAppeared()
            }
            
            if excuseViewModel.excuse.isEmpty {
                ProgressView()
            } else {
                VStack {
                    ForEach(excuseViewModel.excuse, id: \.self) { item in
                        ExcuseBar(excuseViewModel: excuseViewModel, category: item.category, excuse: item.excuse)
                    }
                }
                .transition(AnyTransition.scale.animation(.easeInOut))
            }
        }
        // get data according to selected category
        .onAppear {
            excuseViewModel.setCategory(category: desiredCategory)
            excuseViewModel.getData()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .transition(.opacity)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(excuseViewModel: ExcuseViewModel(), animVM: AnimationsViewModel(), desiredCategory: .familyy)
    }
}
