//
//  NewsModel.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

// url: https://newsapi.org/v2/top-headlines?country=tw&apiKey=1319c20b9e154669b55134b7e5f3821f

import Foundation

struct NewsModel: Codable,Hashable{
    let articles: [Article]
}

struct Article: Codable ,Hashable{
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date // Date解碼要使用 .iso8601  OR type改為 String
}

struct Source: Codable,Hashable{
    let name: String?  // 來源
}
