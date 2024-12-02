//
//  PreviewContent.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import Foundation

var transactionPreviewData = Transaction(id: 10, date: "10/05/2024", institution: "Steve", account: "Master", merchant: "Gray", amount: 50.00, type: "debit", categoryId: 44, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreview = [Transaction](repeating: transactionPreviewData, count: 10)
