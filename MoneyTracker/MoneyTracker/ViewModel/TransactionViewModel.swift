//
//  TransactionViewModel.swift
//  MoneyTracker
//
//  Created by Sarath kumar on 02/12/24.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getTransaction()
    }
    
    func getTransaction() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error Fetching the transaction", error.localizedDescription)
                case .finished:
                    print("Finished Fetching transaction")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellable)

    }
    
    func groupTransaction() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransaction = TransactionGroup(grouping: transactions) { $0.month }
        return groupedTransaction
    }
}

extension TransactionViewModel {
    static let transactionVM: TransactionViewModel = {
        let transactionVM = TransactionViewModel()
         transactionVM.transactions = transactionListPreview
         return transactionVM
     }()
}
