//
//  ActivityIndicator.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView)->Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

struct ActivityIndicatorView: View {
    var isAnimating: Bool
    var body: some View {
        ActivityIndicator(isAnimating: isAnimating)
            .configure {
                $0.color = .black
                $0.style = .large
            }.padding(50)
        
    }
}

/*
 MARK: - Usage
 
 if dataIsLoading {
     Color.black.opacity(0.2).ignoresSafeArea()
     ActivityIndicatorView(isAnimating: dataIsLoading)
 }

 */
