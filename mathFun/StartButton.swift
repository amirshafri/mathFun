//
//  StartButton.swift
//  mathFun
//
//  Created by Amir Shafri on 17/06/2023.
//

import SwiftUI

struct StartButton: View {
    
    @State private var showGameView = false
    
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
                        .cornerRadius(0)
                        .padding()
                }
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

