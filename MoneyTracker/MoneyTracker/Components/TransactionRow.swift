//
//  TransactionRow.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20) {
            
            RoundedRectangle(cornerRadius: 22)
                .foregroundStyle(Color.iconColor.opacity(0.5))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: "INR"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.textColor : .primary)
        }
        .padding([.top,.bottom],8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
