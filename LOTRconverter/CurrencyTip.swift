//
//  CurrencyTip.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 13/05/2025.
//

import TipKit
//נותן לאנשים רמז שאפר ללחוץ על המטבעות לבחירה
struct CurrencyTip: Tip {
    var title = Text ("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")// תמונה שתוצג יחד עם הטיפ
}
