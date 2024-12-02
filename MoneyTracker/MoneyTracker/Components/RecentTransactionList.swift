//
//  RecentTransactionList.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.textColor)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.primary.opacity(0.35), radius: 10, x: 0, y: 5)
        
        
    }
}



#Preview {
    RecentTransactionList()
        .environmentObject(TransactionViewModel.transactionVM)
}
