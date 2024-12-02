//
//  Color+Extension.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 26/11/24.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundColor = Color("Background")
    static let iconColor = Color("Icon")
    static let textColor = Color("Text")
    static let systemBackground = Color(UIColor.systemBackground)
}

extension DateFormatter {
    static let generalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parseDate = DateFormatter.generalFormatter.date(from: self) else {
            return Date()
        }
        return parseDate
    }
}
