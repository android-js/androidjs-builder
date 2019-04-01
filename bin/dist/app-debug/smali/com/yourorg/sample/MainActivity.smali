.class public Lcom/yourorg/sample/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field public static _startedNodeAlready:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "native-lib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 24
    const-string v0, "node"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 28
    const/4 v0, 0x0

    sput-boolean v0, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 32
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    const v3, 0x7f04001b

    invoke-virtual {p0, v3}, Lcom/yourorg/sample/MainActivity;->setContentView(I)V

    .line 34
    const v3, 0x7f0b005e

    invoke-virtual {p0, v3}, Lcom/yourorg/sample/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    .line 35
    .local v1, "myWebView":Landroid/webkit/WebView;
    new-instance v3, Landroid/webkit/WebViewClient;

    invoke-direct {v3}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 36
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 38
    sget-boolean v3, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    if-nez v3, :cond_0

    .line 39
    sput-boolean v4, Lcom/yourorg/sample/MainActivity;->_startedNodeAlready:Z

    .line 40
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/yourorg/sample/MainActivity$1;

    invoke-direct {v4, p0}, Lcom/yourorg/sample/MainActivity$1;-><init>(Lcom/yourorg/sample/MainActivity;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 60
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 62
    :cond_0
    const-string v3, "file:///android_asset/myapp/views/index.html"

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 65
    :try_start_0
    const-string v3, "http://localhost:3000"

    invoke-static {v3}, Lio/socket/client/IO;->socket(Ljava/lang/String;)Lio/socket/client/Socket;

    move-result-object v2

    .line 66
    .local v2, "socket":Lio/socket/client/Socket;
    const-string v3, "connect"

    new-instance v4, Lcom/yourorg/sample/MainActivity$4;

    invoke-direct {v4, p0, v2}, Lcom/yourorg/sample/MainActivity$4;-><init>(Lcom/yourorg/sample/MainActivity;Lio/socket/client/Socket;)V

    invoke-virtual {v2, v3, v4}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v3

    const-string v4, "helloFromNode"

    new-instance v5, Lcom/yourorg/sample/MainActivity$3;

    invoke-direct {v5, p0}, Lcom/yourorg/sample/MainActivity$3;-><init>(Lcom/yourorg/sample/MainActivity;)V

    .line 73
    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v3

    const-string v4, "disconnect"

    new-instance v5, Lcom/yourorg/sample/MainActivity$2;

    invoke-direct {v5, p0}, Lcom/yourorg/sample/MainActivity$2;-><init>(Lcom/yourorg/sample/MainActivity;)V

    .line 81
    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 87
    invoke-virtual {v2}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;

    .line 88
    const-string v3, "helloFromJava"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "Hello Node this is java"

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 89
    const-string v3, "helloFromNode"

    new-instance v4, Lcom/yourorg/sample/MainActivity$5;

    invoke-direct {v4, p0}, Lcom/yourorg/sample/MainActivity$5;-><init>(Lcom/yourorg/sample/MainActivity;)V

    invoke-virtual {v2, v3, v4}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 95
    const-string v3, "getClientPath"

    new-instance v4, Lcom/yourorg/sample/MainActivity$6;

    invoke-direct {v4, p0, v2}, Lcom/yourorg/sample/MainActivity$6;-><init>(Lcom/yourorg/sample/MainActivity;Lio/socket/client/Socket;)V

    invoke-virtual {v2, v3, v4}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v2    # "socket":Lio/socket/client/Socket;
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public native startNodeWithArguments([Ljava/lang/String;)Ljava/lang/Integer;
.end method
