//
//  IconGrid.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 08/05/2025.
//

import SwiftUI
// @Binding let the opponent be replaced to our choice
struct IconGrid: View {
    @Binding var currency: Currency //יצירת סוג נתון שיהיה ניתן לבחור בין המטבעות
    
    var body: some View {
                //Currency Icons
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){ //רשת עם 3 עמודות grids3
                    ForEach(Currency.allCases){ currency in //שיכפול נתון.משתנה, _ מגדיר מספר שכפול.לופ אם לא הוגדר נתון מראש
                        if self.currency == currency {
                            // הקורנצי משווה את עצמו לקורנצי משורה 12 ומסמן אותו לפי הקוד סימון מהשורות הבאות ומשתמש בו
                            CurrencyIcon(CurrencyImage: currency.image, CurrencyText: currency.name)
                            // מביא את כל המטבעות שיש בדאטה
                            // תקיית המטבע.התמונה של המטבע
                            // תקיית המטבע.השם של המטבע
                                .shadow(color: .black, radius: 10)
                            //סימון הבחירה
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }
                        }else{
                            CurrencyIcon(CurrencyImage: currency.image, CurrencyText: currency.name)
                            //מיבא את כל המטבאות לבחירה רחבה
                            //בלי זה זה יראה רק מטבע אחד
                                .onTapGesture { // נותן ללחוץ ולבחור
                                    self.currency = currency
                                }
                        }
                    }
                }
                // במקרה הזה הוגדר קורנסי בשורה 16 אז התוצאה היא שיש לו נתון שהוגדר מראש
                // בפוראיצ בסוגריים בגדרנו את המשתנה קורנצי מהתיקיה קורנצי ואת כל הקייסים שיש בתוכו שיוכל לקרוא את כל התמונות
                
        
                
    }
}

#Preview {
    @Previewable @State var currency: Currency = .silverPiece
    IconGrid( currency: $currency)
        //נותן ערך לתצוגה בגלל שהוספנו ביינדינג
}
