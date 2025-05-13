//
//  Currency.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 09/05/2025.
//

import SwiftUI

// struct נתון.בןאדם
// enum סוג נתון.בןאדם
enum Currency: Double, CaseIterable, Identifiable {
    
    // הגדרה לכל סוג מטבעה את השווי שלו
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // מגדיר את כל במטבעות עם השווי שלהם בשביל הבחירה
    var id: Currency {self}
    
    // self זה המטבע עצמו יעני להחליף את עצמו כשאנחנו בוחרים.מחליפים מטבע זה מחליף את עצמו במטבע שאנו רוצים
    // קוד לבחירת.החלפת המטבע(תמונה)
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    // קוד לבחירת.החלפת המטבע(שם המטבע)
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    //בסוגריים של הפונקציה אנחנו רושמים מידע או את השיוך אם אנחנו רוצים שהפונקציה תעשה פעולה ספציפית במקום ספציפי
    //החץ אומר איזה תוצאה.סוג אנחנו רוצים שתיהיה
    //בסוגריים המפותלים אנחנו רושמים את הפעולה שאנו רוצים שתיהיה במקרה הזה פעולת המרה
    // הגארד שומר על האפליקציה לא לקרוס במידה ויקלידו משהו לא נכון
    // רטורן פסיקים אומר שהקוד לא יחיז שום דבר בוא רק יבצע את מה שביקשנו
    func convert(from amoutString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amoutString) else {
            return ""
        } //אם ההמרה נכשלת (כלומר, המחרוזת לא מייצגת מספר תקף), הפונקציה תחזיר מחרוזת ריקה ("")
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format:  "%.2f" ,convertedAmount)
    }
}

// הפונקציה מקבלת מחרוזת שמכילה סכום כספי, ומטבע יעד. היא ממירה את הסכום מהמטבע הנוכחי (כנראה self בתוך Currency) למטבע היעד ומחזירה את התוצאה כמחרוזת מעוגלת.
// הפורמט %3.f אומר: הצג מספר עם לפחות שתי ספרות, ללא ספרות אחרי הנקודה העשרונית.
//רואו וואליו זה הערך של הכסף או הנתון שהגדרנו
//כך ערך (קייס) בקורנסי מקבל ערך (רואו וואליו) מסוג דאבל
