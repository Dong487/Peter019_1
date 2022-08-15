//
//  NewsService.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

// 使用 async await
import Foundation

class NewsService{
    
    let url: String = "https://newsapi.org/v2/top-headlines?country=tw&apiKey=1319c20b9e154669b55134b7e5f3821f"
    
    func getNewsData() async throws -> [Article] {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL // 拋出錯誤 讓用戶知道
        }
        
        do {
            let (data ,response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200  else {
                throw APIError.invalidResponseStatus
            }
            print("伺服器響應成功")
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // 時間的解碼方式 (有些不行Model type可以改用String)
                decoder.keyDecodingStrategy = .useDefaultKeys
                
                
                // 最常是停止點的地方 (通常是Model 內的type有問題)
                let decodedData = try decoder.decode(NewsModel.self, from: data)

                return decodedData.articles
               
            } catch  {
                print("XXX_XXX")
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch  {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}

enum APIError: Error ,LocalizedError{
    case invalidURL                     // 無效網址
    case invalidResponseStatus          // 響應失敗
    case dataTaskError(String)          // Task錯誤
    case corruptData                    // 數據錯誤
    case decodingError(String)          // 解碼錯誤
    
    var errorDescription: String?{
        // NSLocalizedString("自定義ERROR描述", comment: <#T##String#>)
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is invalid(無效的URL網址)", comment: "")
        case .invalidResponseStatus:
            return NSLocalizedString("The API failed to issue a valid response(伺服器沒有響應)", comment: "")
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return NSLocalizedString("The data provided appears to be corrupt(數據損毀)", comment: "")
        case .decodingError(let string):
            return string
        }
    }
}
