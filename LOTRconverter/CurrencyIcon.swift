//
//  CurrencyIcon.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 08/05/2025.
//

import SwiftUI

struct CurrencyIcon: View {
    let CurrencyImage: ImageResource
    let CurrencyText: String
    
    var body: some View {
        
                //Currency Icons
                ZStack(alignment: .bottom){//coin box       
                    //Currency Image
                    Image(CurrencyImage)
                        .resizable()
                        .scaledToFit()
                    //Currency name
                    Text(CurrencyText)
                        .padding(1) // גובה הטקסט
                        .font(.caption)
                        .fixedSize()
                        .frame(maxWidth: .infinity) // מותח את המסגרת למקסימום המוגדר למטה 100
                        .background(.brown.opacity(0.75))
                }
                .padding()
                .frame(width: 100,height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25)) //coin box shape
               
        
    }
}

#Preview {
    CurrencyIcon(CurrencyImage: .goldpiece, CurrencyText: "Gold Piece")
}
