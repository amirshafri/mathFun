//
//  ContentView.swift
//  mathFun
//
//  Created by Amir Shafri on 17/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0,1,2,3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 1000
    @State private var score = 0
    @State private var timerValue = 0
    @State private var timer: Timer? = nil
    var body: some View {
        VStack {
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            HStack{
                ForEach(0..<2){
                    index in Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswer()
                    } label: {
                        AnswerButton(number: choiceArray[index]).frame(height: 100)
                    }
                }
            }
            HStack{
                ForEach(2..<4){
                    index in Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswer()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            Text("Time: \(timerValue) Score: \(score)")
                .font(.headline)
                .bold()
        }
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }
    
    func generateAnswer(){
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        var answerList = [Int]()
        correctAnswer = firstNumber + secondNumber
        for _ in 0...2{
            answerList.append(Int.random(in: 0...difficulty))
        }
        answerList.append(correctAnswer)
        choiceArray = answerList.shuffled()
        
    }
    
    func answerIsCorrect(answer: Int){
        self.score = answer == correctAnswer ? self.score + 1 : self.score - 1
    }
    
    func startTimer() {
        generateAnswer()
          timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
              timerValue += 1
          }
      }
      
      func stopTimer() {
          timer?.invalidate()
          timer = nil
      }
    
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding(.top)
            .environment(\.sizeCategory, .large)
            
            
            
            
    }
}
