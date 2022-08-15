//
//  ListRowView.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Article
    
    var body: some View {
        HStack(spacing: 10){

            if (item.urlToImage != nil){
                AsyncImage(url: URL(string: item.urlToImage!)) { returnedImage in
                    returnedImage
                        .resizable()
                        .frame(width: 100 ,height: 100)
                        .cornerRadius(20)
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 100 ,height: 100)
                        .cornerRadius(20)
                }
     
            } else {
                Image(systemName: "questionmark")
                    .resizable()
                    .frame(width: 100 ,height: 100)
                    .cornerRadius(20)
            }
            VStack{
                Text(item.title)
                    .font(.headline)
                
                Spacer()
            }
            .padding(.top ,6)
                
        }
        .frame(height: 105)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item:
                        Article(
                            source: Source(name: "Ltn.com.tw"),
                            author: "自由時報",
                            title: "中職Live》嚴宏鈞驚天一轟、梁家榮超前安！ 桃猿逆轉兄弟奪勝 - 自由時報",
                            articleDescription: "第九局9下，樂天換投：豪勁。代打蘇緯達被三振，江坤宇三壘滾地球出局，王威晨三壘滾地出局，桃猿4：3逆轉兄弟成功。9上，蔡齊哲續投，林泓育被觸身球上壘，樂天換上蔡鎮宇代跑，朱育賢中外野安打，蔡鎮宇上三壘，一、三壘有人。兄弟換投：呂彥青。梁家榮左外野方向安打超前，樂天4：3領先。陳晨威內野小飛球出局，1",
                            url: "https://sports.ltn.com.tw/news/breakingnews/4025092",
                            urlToImage: "https://img.ltn.com.tw/Upload/sports/page/800S/2022/08/14/php12fD2Q.jpg",
                            publishedAt: Date()
                        )
        )
    }
}

//  使用 AsyImage 另一種寫法
//            AsyncImage(url: URL(string: item.url)){ phase in
//                switch phase{
//                case .success(let returnedImage):
//                    returnedImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100 ,height: 100)
//                        .cornerRadius(20)
//                case .empty:
//                    ProgressView()
//                case .failure:
//                    Image(systemName: "questionmark")
//                        .font(.headline)
//                default:
//                    Image(systemName: "questionmark")
//                        .font(.headline)
//                }
//            }
