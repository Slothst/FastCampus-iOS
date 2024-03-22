//
//  MonthlyIDGenerator.swift
//  EmotionDiary
//
//  Created by 최낙주 on 3/22/24.
//

import Foundation

final class MonthlyIDGenerator {
    func monthlyID(with diary: MoodDiary) -> String {
        let dateString = diary.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        guard let date = formatter.date(from: dateString) else { return "" }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.year, .month], from: date)
        
        return "\(dateComponents.year!)-\(dateComponents.month!)"
    }
}
