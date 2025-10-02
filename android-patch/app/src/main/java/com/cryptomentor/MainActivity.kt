
package com.cryptomentor

import android.os.Bundle
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val webView = WebView(this)
        setContentView(webView)

        val settings: WebSettings = webView.settings
        settings.javaScriptEnabled = true
        settings.domStorageEnabled = true
        settings.allowContentAccess = true
        settings.allowFileAccess = true
        settings.loadsImagesAutomatically = true

        webView.webViewClient = WebViewClient()
        webView.webChromeClient = WebChromeClient()

        // Load a guaranteed-visible local page to avoid blank screen
        webView.loadUrl("file:///android_asset/index.html")
    }
}
