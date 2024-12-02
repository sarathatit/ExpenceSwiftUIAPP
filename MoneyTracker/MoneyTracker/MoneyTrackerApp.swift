//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 26/11/24.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    @StateObject var transactionVM = TransactionViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(transactionVM)
        }
    }
}
