//
//  WebView.swift
//  Peter019_1
//
//  Created by DONG SHENG on 2022/8/14.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
