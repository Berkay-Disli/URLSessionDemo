//
//  CategorySelector.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import SwiftUI

struct CategorySelector: View {
    @StateObject var excuseViewModel = ExcuseViewModel()
    @StateObject var animVM = AnimationsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("pink").opacity(0.1), Color("blue").opacity(0.1)], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .ignoresSafeArea()
                
                VStack {
                    //header
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            if animVM.header1 {
                                Text("So...")
                                    .font(.title2)
                                    .transition(AnyTransition.opacity.animation(.easeInOut))
                            }
                            if animVM.header2 {
                                Text("You need an excuse?")
                                    .font(.title).bold()
                                    .transition(AnyTransition.opacity.animation(.easeInOut))
                            }
                            
                            if animVM.main {
                                Text("Choose a category")
                                    .font(.title3).bold()
                                    .padding(.top)
                                    .transition(AnyTransition.opacity.animation(.easeInOut))
                            }
                        }
                        .foregroundColor(Color(uiColor: .darkGray))
                        
                        Spacer()
                    }
                    .padding([.horizontal, .top]).padding([.top, .horizontal]).padding(.top, 40)
                    
                    
                    
                    // category select
                    VStack {
                        if animVM.categories {
                            ForEach(Category.allCases, id: \.self) { item in
                                NavigationLink {
                                    Main(excuseViewModel: excuseViewModel, animVM: animVM, desiredCategory: item)
                                } label: {
                                    CategoryButtons(categoryName: item.title)
                                        .padding(.top)
                                }
                                .transition(AnyTransition.opacity.animation(.easeInOut))
                            }
                            
                        }
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CategorySelector_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelector()
    }
}
