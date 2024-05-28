//
//  PaymentViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/28/24.
//

import UIKit
import WebKit

final class PaymentViewController: UIViewController {
    private var webView: WKWebView = WKWebView()
    private let getMessageScriptName: String = "receiveMessage"
    private let getPaymentCompleteScriptName: String = "paymentComplete"

    override func loadView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: getMessageScriptName)
        contentController.add(self, name: getPaymentCompleteScriptName)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView()
        setUserAgent()
        
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 100))
        button.setTitle("call javaScript", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.callJavaScript()
        }, for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func loadWebView() {
        guard let htmlPath = Bundle.main.path(forResource: "test", ofType: "html") else { return }
        let url = URL(fileURLWithPath: htmlPath)
        var request = URLRequest(url: url)
        request.addValue("customValue", forHTTPHeaderField: "Header-Name")
        webView.load(request)
    }
    
    private func setUserAgent() {
        webView.customUserAgent = "Cproject/1.0.0/iOS"
    }
    
    private func setCookie() {
        guard let cookie = HTTPCookie(properties: [
            .domain: "google.co.kr",
            .path: "/",
            .name: "myCookie",
            .value: "value",
            .secure: "FALSE",
            .expires: NSDate(timeIntervalSinceNow: 3600)
        ]) else { return }
        webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
    }
    
    private func callJavaScript() {
        webView.evaluateJavaScript("javascriptFunction();")
    }
}

extension PaymentViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == getMessageScriptName {
            print("\(message.body)")
            // viewModel.process(action: .getMessage)
        } else if message.name == getPaymentCompleteScriptName {
            print("\(message.body)")
            // viewModel.process(action: .completePayment)
        }
    }
}

#Preview {
    PaymentViewController()
}
