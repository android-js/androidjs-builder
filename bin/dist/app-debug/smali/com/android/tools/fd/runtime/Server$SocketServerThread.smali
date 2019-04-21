.class Lcom/android/tools/fd/runtime/Server$SocketServerThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/runtime/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketServerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/tools/fd/runtime/Server;


# direct methods
.method private constructor <init>(Lcom/android/tools/fd/runtime/Server;)V
    .locals 0

    .prologue
    .line 130
    iput-object p1, p0, Lcom/android/tools/fd/runtime/Server$SocketServerThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/tools/fd/runtime/Server;Lcom/android/tools/fd/runtime/Server$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/tools/fd/runtime/Server;
    .param p2, "x1"    # Lcom/android/tools/fd/runtime/Server$1;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/android/tools/fd/runtime/Server$SocketServerThread;-><init>(Lcom/android/tools/fd/runtime/Server;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    .line 153
    :cond_0
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/android/tools/fd/runtime/Server$SocketServerThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v4}, Lcom/android/tools/fd/runtime/Server;->access$100(Lcom/android/tools/fd/runtime/Server;)Landroid/net/LocalServerSocket;

    move-result-object v1

    .line 154
    .local v1, "serverSocket":Landroid/net/LocalServerSocket;
    if-nez v1, :cond_1

    .line 180
    :goto_1
    return-void

    .line 157
    :cond_1
    invoke-virtual {v1}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    move-result-object v2

    .line 159
    .local v2, "socket":Landroid/net/LocalSocket;
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 160
    const-string/jumbo v4, "InstantRun"

    const-string/jumbo v5, "Received connection from IDE: spawning connection thread"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    :cond_2
    new-instance v3, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;

    iget-object v4, p0, Lcom/android/tools/fd/runtime/Server$SocketServerThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-direct {v3, v4, v2}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;-><init>(Lcom/android/tools/fd/runtime/Server;Landroid/net/LocalSocket;)V

    .line 165
    .local v3, "socketServerReplyThread":Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;
    invoke-virtual {v3}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->run()V

    .line 167
    invoke-static {}, Lcom/android/tools/fd/runtime/Server;->access$200()I

    move-result v4

    const/16 v5, 0x32

    if-le v4, v5, :cond_0

    .line 168
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 169
    const-string/jumbo v4, "InstantRun"

    const-string/jumbo v5, "Stopping server: too many wrong token connections"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    :cond_3
    iget-object v4, p0, Lcom/android/tools/fd/runtime/Server$SocketServerThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v4}, Lcom/android/tools/fd/runtime/Server;->access$100(Lcom/android/tools/fd/runtime/Server;)Landroid/net/LocalServerSocket;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/LocalServerSocket;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 174
    .end local v1    # "serverSocket":Landroid/net/LocalServerSocket;
    .end local v2    # "socket":Landroid/net/LocalSocket;
    .end local v3    # "socketServerReplyThread":Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "InstantRun"

    invoke-static {v4, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 176
    const-string/jumbo v4, "InstantRun"

    const-string/jumbo v5, "Fatal error accepting connection on local socket"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
