.class public Lcom/android/js/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field public static _startedNodeAlready:Z


# instance fields
.field public myWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
<<<<<<< HEAD
    .line 29
=======
    .line 33
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const-string v0, "native-lib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

<<<<<<< HEAD
    .line 30
=======
    .line 34
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const-string v0, "node"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

<<<<<<< HEAD
    .line 48
=======
    .line 52
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/js/MainActivity;->_startedNodeAlready:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
<<<<<<< HEAD
    .line 25
=======
    .line 29
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
<<<<<<< HEAD
    .line 39
=======
    .line 43
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

<<<<<<< HEAD
    .line 40
=======
    .line 44
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

<<<<<<< HEAD
    .line 44
    :goto_0
    return-void

    .line 42
=======
    .line 48
    :goto_0
    return-void

    .line 46
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_0
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

<<<<<<< HEAD
    .line 52
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
=======
    .line 56
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 57
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const v0, 0x7f04001c

    invoke-virtual {p0, v0}, Lcom/android/js/MainActivity;->setContentView(I)V

<<<<<<< HEAD
    .line 56
=======
    .line 60
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

<<<<<<< HEAD
    .line 57
    invoke-static {p0, p0}, Lcom/android/js/PermissionRequest;->checkAndAskForPermissions(Landroid/app/Activity;Landroid/content/Context;)V

    .line 59
=======
    .line 61
    invoke-static {p0, p0}, Lcom/android/js/PermissionRequest;->checkAndAskForPermissions(Landroid/app/Activity;Landroid/content/Context;)V

    .line 63
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-boolean v0, Lcom/android/js/MainActivity;->_startedNodeAlready:Z

    if-nez v0, :cond_0

<<<<<<< HEAD
    .line 60
    sput-boolean v3, Lcom/android/js/MainActivity;->_startedNodeAlready:Z

    .line 61
=======
    .line 64
    sput-boolean v3, Lcom/android/js/MainActivity;->_startedNodeAlready:Z

    .line 65
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/js/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/android/js/MainActivity$1;-><init>(Lcom/android/js/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

<<<<<<< HEAD
    .line 81
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 88
=======
    .line 85
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 91
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_0
    const v0, 0x7f0b0085

    invoke-virtual {p0, v0}, Lcom/android/js/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

<<<<<<< HEAD
    .line 92
=======
    .line 95
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/android/js/JavaIPC;

    iget-object v2, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-direct {v1, p0, v2}, Lcom/android/js/JavaIPC;-><init>(Lcom/android/js/MainActivity;Landroid/webkit/WebView;)V

    const-string v2, "android"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

<<<<<<< HEAD
    .line 95
=======
    .line 98
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

<<<<<<< HEAD
    .line 96
=======
    .line 99
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

<<<<<<< HEAD
    .line 97
=======
    .line 100
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

<<<<<<< HEAD
    .line 98
=======
    .line 101
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-static {v3}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

<<<<<<< HEAD
    .line 99
=======
    .line 102
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    new-instance v1, Landroid/webkit/WebViewClient;

    invoke-direct {v1}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

<<<<<<< HEAD
    .line 100
=======
    .line 103
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

<<<<<<< HEAD
    .line 101
=======
    .line 104
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

<<<<<<< HEAD
    .line 102
=======
    .line 105
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    sget-object v1, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

<<<<<<< HEAD
    .line 104
=======
    .line 107
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/myapp/views/index.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

<<<<<<< HEAD
    .line 110
=======
    .line 113
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/MainActivity;->myWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/android/js/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/android/js/MainActivity$2;-><init>(Lcom/android/js/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

<<<<<<< HEAD
    .line 132
=======
    .line 135
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method

.method public native startNodeWithArguments([Ljava/lang/String;)Ljava/lang/Integer;
.end method
