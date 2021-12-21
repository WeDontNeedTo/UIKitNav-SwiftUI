//
//  HomeView.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import SwiftUI

struct HomeView: View {
    var pushToDetailVC: () -> Void
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("News")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { item in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                                .frame(width: 150, height: 150, alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            VStack {
                HStack {
                    Text("Info")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { item in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(item % 2 == 0 ? Color.red : Color.blue)
                                .frame(width: 150, height: 150, alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            VStack {
                HStack {
                    Text("Company")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.cyan)
                    .frame(width: 250, height: 200, alignment: .leading)
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 50, maximum: 180), spacing: 10, alignment: .center),
                GridItem(.flexible(minimum: 50, maximum: 180), spacing: 10, alignment: .center)]) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .frame(height: 200, alignment: .leading)
                    
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                            .frame(height: 200, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(height: 200, alignment: .leading)
                
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(height: 200, alignment: .leading)

            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pushToDetailVC: {})
    }
}
