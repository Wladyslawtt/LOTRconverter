//
//  ExchangeInfo.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 08/05/2025.
//

import SwiftUI
// @evironment using stuff thats built in to the system in general
struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss //cancel second screen
    
    
    var body: some View {
        ZStack{
            //Background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
                
            VStack{
                //title text
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(3)
                //description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                //exchange rates
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text:"1 Gold Penny = 4 Silver Pieces ", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                //done button
                Button("Done"){
                    dismiss()  //cancel 2 screen
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

