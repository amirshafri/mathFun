//
//  ContentView.swift
//  mathFun
//
//  Created by Amir Shafri on 17/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showGame = false
    var body: some View {
            VStack {
                StartButton()
            }
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding(.top)
            .environment(\.sizeCategory, .large)
    }
}
