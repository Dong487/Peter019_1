//
//  HomeView.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List{
                HStack{
                    Text("現在時間 ")
                        .font(.title2)
                    Spacer()
                    Text("\(viewModel.dateFormatter.string(from: Date()))")
                        .font(.headline)
                }
                ForEach(viewModel.newsData ,id: \.self){ item in
 
                    NavigationLink {
                        ZStack{
                            WebView(url: URL(string: item.url)!)
                        }
                        .ignoresSafeArea()
                    } label: {
                        ListRowView(item: item)
                    }

                }
            }
            .listStyle(InsetListStyle())
            .refreshable(action: {
                await viewModel.fetchData()
            })
            .navigationTitle("即時新聞")
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
