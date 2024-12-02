//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("OverView")
                        .bold()
                        .font(.title2)
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.iconColor, .primary)
                        
                }
            })
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(TransactionViewModel.transactionVM)
}
