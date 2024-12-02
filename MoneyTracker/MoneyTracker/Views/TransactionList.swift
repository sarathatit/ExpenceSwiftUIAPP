//
//  TransactionList.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionVM.groupTransaction()), id:\.key) { month, transaction in
                    Section {
                        ForEach(transaction) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TransactionList()
            .environmentObject(TransactionViewModel.transactionVM)
    }
}
