//
//  ContentView.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 06/05/2025.
//

import SwiftUI
import TipKit
// @state using stuff from the SwiftUI aka this screen.לא מקבע.מחליף בחירה
// @Binding let the opponent be replaced to our choice.כן מקבע.מחליף בחירה
//סימן הדולר זהו סימן מחייב כשאנחנו מוסיפים אותו הוא מחייב להשתמש בנתון שהשתמשנו.הוספנו
//@focustate עוזר לנו לעקוב אחר הנתון שאנו מתמקדים בו
struct ContentView: View {
    @State var showExchangeInfo = false//hide 2 screen
    @State var showSelectedCorrency = false//hide 2 screen
    
    @State var leftAmount = "" //num
    @State var rightAmount = "" //num
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var righttCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            //Background Image
            Image(.background)
                .resizable() // size of the image
                .ignoresSafeArea() //disable the white borders
                .frame(width : 450, height: 800)
            
            VStack{
                //Prancing Pony ImageView
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                
                //Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle) //Size text
                    .foregroundStyle(.white) //color text
                //Conversion Section
                HStack{
                    //Left conversion section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Image(leftCurrency.image)//מקשר את נתוני בתמונה
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text(leftCurrency.name)//מקשר את נתוני השם
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCorrency.toggle()//הופך ללחיץ
                            currencyTip.invalidate(reason: .actionPerformed)//מבטל את הטיפ ברגע שהמשתמש לומד את הטיפ
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)//מוציא רמז לאפשר לללחוץ ולהחליף מטבע
                        
                        //Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)//עוקב אחר ההקלדה
                            .onChange(of: leftAmount) {
                                if leftTyping == true {rightAmount = leftCurrency
                                        .convert(from:  leftAmount, to: righttCurrency)
                                }//קוד לפעולת המרה
                            }//if רק אם אני מקליד יש לעשות המרה
                            .onChange(of: leftCurrency){
                                leftAmount = righttCurrency.convert(from: rightAmount, to: leftCurrency)
                            }//מעדכן אוטומטית את ההמרה כשבוחרים מטבע אחר
                        
                    }
                    //Equal Sign
                    Image(systemName: "equal") //symbol
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse) //effect
                    
                    //Right conversion section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Text
                            Text(righttCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(righttCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                       
                            
                            
                            //Text field
                            TextField("Amount", text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.trailing)
                                .focused($rightTyping)
                                .onChange(of: rightAmount){
                                    if rightTyping == true {
                                        leftAmount = righttCurrency.convert(from: rightAmount, to: leftCurrency)
                                    }
                                }
                                .onChange(of: righttCurrency){
                                    rightAmount = leftCurrency
                                        .convert(from:  leftAmount, to: righttCurrency)//מעדכן אוטומטית את ההמרה כשבוחרים מטבע אחר
                                }
                        }
                        
                    }
                    .padding()
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .keyboardType(.decimalPad)//סוג מקלדת
                    
                    Spacer()
                    
                    //Info Button - link to 2 screen
                    HStack {
                        Spacer()
                        Button{
                            showExchangeInfo.toggle()
                        }label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.trailing)
                        }
                    }
                    
                    .task {
                        try? Tips.configure()
                    }//מאשר להציג את הרמז שאפשר ללחוץ ולהחליף מטבע
                    .padding(.trailing, 30)
                    .sheet(isPresented: $showExchangeInfo) { ExchangeInfo() //pull up a second screen
                    }
                }
            }
            
            
            .sheet(isPresented: $showSelectedCorrency){
                SelectCurrency(topCurrency: $leftCurrency, buttomCurrency: $righttCurrency)
            } //pull up a third screen
        }
    }
    
    
    #Preview {
        ContentView()
    }


//@Binding בנוסף לכך הוא מקשר את הבחירה שלנו למסך הראשי כך כשאנחנו בוחרים משהו הוא שולח תשובה למסך הראשי על הבחירה שלנו ומחליף למה שבחרנו
//@State לאומת זאת סטייט לא שולח את התשובה למסך הראשי הוא יותר מקבע נתונים קיימים מאשר מחליף אותם בגלל זה אם נכתוב סטייט לא נראה שום שינוי
//טאסק זוהי אסינכרונית  שמופעלת ברגע שהתצוגה מוצגת לראשונה. זה בעצם כמו:
//.onAppear {
//אבל טאסק היא מתאימה לפונקציות אסינכרוניות  לדוגמה כאלה שעובדות עם רשת, טעינה, קונפיגורציה, וכו’.
// טיפס.קונפיגוריישן זה נראה שזו פונקציה שאתה משתמש בה (או מקבל מספריה) בשביל להגדיר את המערכת של ה"טיפים" – אולי הצעות למשתמש, טיפים בתוך האפליקציה, הדרכות קצרות וכו'.
//
//בדרך כלל פונקציות כאלו:
//
//טוענות קובץ הגדרות
//מתחברות לשרת
//מגדירות אילו טיפים יופיעו ובאילו מצבים
//
//טיפס קונפיגוריישן כנראה יכולה לזרוק שגיאה . ולכן אתה צריך לטפל בזה עם טריי.
// טריי תנסה להריץ את הפונקציה אם יש שגיאה – תתעלם ממנה (לא תעוף שגיאה למסך, פשוט תחזיר ניל)
//זאת דרך בטוחה להגיד:
////"תנסה להריץ, ואם זה נכשל – לא נורא, תמשיך כרגיל"
//קונפיגור היא פונקציה שמבצעת פעולת הגדרה או הכנה של מערכת או שירות באפליקציה. במקרה שלך — טיפס.קונפיגור כנראה באה מתוך ספרייה חיצונית (או שלך) שנקראת טיפס או דומה.
//זו פונקציה שבדרך כלל:
//* מאתחלת שירות (כמו טיפים למשתמש, הדרכה, אנליטיקה, הודעות בתוך האפליקציה וכו
//* טוענת הגדרות מקובץ או מהשרת
//* מכינה את הספרייה לפעולה – כדי שתוכל להשתמש בה בהמשך באפליקציה
//
//טאסק רץ ברגע שהמסך נטען .
//שימושי לפעולות רקע, טעינת מידע, או אתחול של מערכות כמו:
//* אנליטיקה
//* ספריות
//* הודעות עזרה .טיפס
