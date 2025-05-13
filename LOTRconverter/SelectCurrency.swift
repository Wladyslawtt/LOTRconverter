//
//  SelectCurrency.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 08/05/2025.
//

import SwiftUI
// @Binding let the opponent be replaced to our choice
struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss //cancel third screen
    
    @Binding var topCurrency: Currency //יצירת סוג נתון שיהיה ניתן לבחור בין המטבעות
    @Binding var buttomCurrency: Currency
    
    var body: some View {
        ZStack{
            //Parchmant Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //Currency Icons
                IconGrid(currency: $topCurrency)
                //משווה את המטבעות מהדאטה לבחירה שלנו

                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //currency Icons
                IconGrid(currency: $buttomCurrency)
                //משווה את המטבעות מהדאטה לבחירה שלנו
                
                //Done Button
                Button("Done"){
                    dismiss()  //cancel 3 screen
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
            //הופך את הצבע לשחור גם במצב בהיר של הטלפון
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var buttomCurrency: Currency = .goldPenny
    //נותן ערך לתצוגה בגלל שהוספנו ביינדינג

    SelectCurrency(topCurrency: $topCurrency, buttomCurrency: $buttomCurrency)
}
