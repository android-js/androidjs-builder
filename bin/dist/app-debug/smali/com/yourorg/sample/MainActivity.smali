.class public Lcom/yourorg/sample/MainActivity;
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
    .line 26
    const-string v0, "native-lib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 27
    const-string v0, "node"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 41
    :goto_0
    return-void

    .line 39
    :cond_0
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 49
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v3, 0x7f04001b

    invoke-virtual {p0, v3}, Lcom/yourorg/sample/MainActivity;->setContentView(I)V

    .line 52
    sget-boolean v3, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    if-nez v3, :cond_0

    .line 53
    sput-boolean v5, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    .line 54
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/yourorg/sample/MainActivity$1;

    invoke-direct {v4, p0}, Lcom/yourorg/sample/MainActivity$1;-><init>(Lcom/yourorg/sample/MainActivity;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 74
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 79
    :cond_0
    const v3, 0x7f0b005e

    invoke-virtual {p0, v3}, Lcom/yourorg/sample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    .line 80
    iget-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    new-instance v4, Landroid/webkit/WebViewClient;

    invoke-direct {v4}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 81
    iget-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 82
    iget-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 83
    iget-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 84
    iget-object v3, p0, Lcom/yourorg/sample/MainActivity;->myWebView:Landroid/webkit/WebView;

    const-string v4, "file:///android_asset/myapp/views/index.html"

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 102
    const/4 v0, 0x0

    .line 104
    .local v0, "Socket":Lcom/yourorg/sample/JavaIPC;
    :try_start_0
    new-instance v1, Lcom/yourorg/sample/JavaIPC;

    const/16 v3, 0xbb9

    invoke-direct {v1, v3}, Lcom/yourorg/sample/JavaIPC;-><init>(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .end local v0    # "Socket":Lcom/yourorg/sample/JavaIPC;
    .local v1, "Socket":Lcom/yourorg/sample/JavaIPC;
    :try_start_1
    invoke-virtual {v1}, Lcom/yourorg/sample/JavaIPC;->start()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v1

    .line 160
    .end local v1    # "Socket":Lcom/yourorg/sample/JavaIPC;
    .restart local v0    # "Socket":Lcom/yourorg/sample/JavaIPC;
    :goto_0
    return-void

    .line 106
    :catch_0
    move-exception v2

    .line 107
    .local v2, "e":Ljava/io/IOException;
    :goto_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 106
    .end local v0    # "Socket":Lcom/yourorg/sample/JavaIPC;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "Socket":Lcom/yourorg/sample/JavaIPC;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "Socket":Lcom/yourorg/sample/JavaIPC;
    .restart local v0    # "Socket":Lcom/yourorg/sample/JavaIPC;
    goto :goto_1
.end method

.method public native startNodeWithArguments([Ljava/lang/String;)Ljava/lang/Integer;
.end method
