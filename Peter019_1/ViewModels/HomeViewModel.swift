//
//  HomeViewModel.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var newsData: [Article] = []
    let service = NewsService()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy - MM - dd, HH:mm "
        return formatter
    }
    
    func fetchData() async {
        
        do{
            let data = try await service.getNewsData()
            await MainActor.run{
                self.newsData = data
            }

        } catch{
            print("Fetch Data error")
        }
        
    }
}
