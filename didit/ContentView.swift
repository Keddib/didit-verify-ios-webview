//
//  ContentView.swift
//  didit
//
//  Created by keddib on 7/8/2025.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebViewScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://192.168.68.101:6001")!)
                .navigationTitle("Verify")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        }
                    }
                }
        }
    }
}

struct ContentView: View {
    @State private var showWebView = false

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            Image(systemName: "checkmark.shield")
                .font(.system(size: 80))
                .foregroundColor(.blue)

            Text("DiDit Verify")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Tap the button below to start verification")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Verify") {
                showWebView = true
            }
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(25)

            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showWebView) {
            WebViewScreen()
        }
    }
}

#Preview {
    ContentView()
}
