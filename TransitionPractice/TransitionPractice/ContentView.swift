//
//  ContentView.swift
//  TransitionPractice
//
//  Created by hwanghye on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image(.launch)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.top, 60)
                Spacer()
                Image(.onboarding)
                    .imageScale(.large)
                Spacer()
                NavigationLink {
                    MBTIView()
                } label: {
                    Text("시작하기")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(100)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
