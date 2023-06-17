//
//  StartButton.swift
//  mathFun
//
//  Created by Amir Shafri on 17/06/2023.
//

import SwiftUI

struct StartButton: View {
    
    @State private var showGameView = false
    @State private var isAnimating = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showGameView = true
                } label: {
                    Text("Start Game")
                        .frame(width: 240, height: 60)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .onAppear {
                            isAnimating = true
                        }                }
            }
            .navigationTitle("")
            .navigationDestination(isPresented: $showGameView) {
                GameView()
            }
        }
    }
}


struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}

