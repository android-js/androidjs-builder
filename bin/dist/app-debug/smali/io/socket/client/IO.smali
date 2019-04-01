.class public Lio/socket/client/IO;
.super Ljava/lang/Object;
.source "IO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/IO$Options;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final managers:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/socket/client/Manager;",
            ">;"
        }
    .end annotation
.end field

.field public static protocol:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lio/socket/client/IO;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    .line 20
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    const/4 v0, 0x4

    sput v0, Lio/socket/client/IO;->protocol:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setDefaultOkHttpCallFactory(Lokhttp3/Call$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/Call$Factory;

    .prologue
    .line 32
    sput-object p0, Lio/socket/client/Manager;->defaultCallFactory:Lokhttp3/Call$Factory;

    .line 33
    return-void
.end method

.method public static setDefaultOkHttpWebSocketFactory(Lokhttp3/WebSocket$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/WebSocket$Factory;

    .prologue
    .line 28
    sput-object p0, Lio/socket/client/Manager;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 29
    return-void
.end method

.method public static socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "opts"    # Lio/socket/client/IO$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 42
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;)Lio/socket/client/Socket;
    .locals 1
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/socket/client/IO;->socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static socket(Ljava/net/URI;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;
    .locals 13
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "opts"    # Lio/socket/client/IO$Options;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 57
    if-nez p1, :cond_0

    .line 58
    new-instance p1, Lio/socket/client/IO$Options;

    .end local p1    # "opts":Lio/socket/client/IO$Options;
    invoke-direct {p1}, Lio/socket/client/IO$Options;-><init>()V

    .line 61
    .restart local p1    # "opts":Lio/socket/client/IO$Options;
    :cond_0
    invoke-static {p0}, Lio/socket/client/Url;->parse(Ljava/net/URI;)Ljava/net/URL;

    move-result-object v4

    .line 64
    .local v4, "parsed":Ljava/net/URL;
    :try_start_0
    invoke-virtual {v4}, Ljava/net/URL;->toURI()Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 68
    .local v8, "source":Ljava/net/URI;
    invoke-static {v4}, Lio/socket/client/Url;->extractId(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "id":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 70
    .local v5, "path":Ljava/lang/String;
    sget-object v9, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    sget-object v9, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    invoke-virtual {v9, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lio/socket/client/Manager;

    iget-object v9, v9, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, v5}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    move v7, v10

    .line 72
    .local v7, "sameNamespace":Z
    :goto_0
    iget-boolean v9, p1, Lio/socket/client/IO$Options;->forceNew:Z

    if-nez v9, :cond_1

    iget-boolean v9, p1, Lio/socket/client/IO$Options;->multiplex:Z

    if-eqz v9, :cond_1

    if-eqz v7, :cond_6

    :cond_1
    move v3, v10

    .line 75
    .local v3, "newConnection":Z
    :goto_1
    if-eqz v3, :cond_7

    .line 76
    sget-object v9, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v9, v12}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 77
    sget-object v9, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    const-string v12, "ignoring socket cache for %s"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v8, v10, v11

    invoke-static {v12, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 79
    :cond_2
    new-instance v2, Lio/socket/client/Manager;

    invoke-direct {v2, v8, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .line 90
    .local v2, "io":Lio/socket/client/Manager;
    :goto_2
    invoke-virtual {v4}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v6

    .line 91
    .local v6, "query":Ljava/lang/String;
    if-eqz v6, :cond_4

    iget-object v9, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    if-eqz v9, :cond_3

    iget-object v9, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 92
    :cond_3
    iput-object v6, p1, Lio/socket/client/IO$Options;->query:Ljava/lang/String;

    .line 95
    :cond_4
    invoke-virtual {v4}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9, p1}, Lio/socket/client/Manager;->socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;

    move-result-object v9

    return-object v9

    .line 65
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "io":Lio/socket/client/Manager;
    .end local v3    # "newConnection":Z
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "query":Ljava/lang/String;
    .end local v7    # "sameNamespace":Z
    .end local v8    # "source":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v9, Ljava/lang/RuntimeException;

    invoke-direct {v9, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v1    # "id":Ljava/lang/String;
    .restart local v5    # "path":Ljava/lang/String;
    .restart local v8    # "source":Ljava/net/URI;
    :cond_5
    move v7, v11

    .line 71
    goto :goto_0

    .restart local v7    # "sameNamespace":Z
    :cond_6
    move v3, v11

    .line 72
    goto :goto_1

    .line 81
    .restart local v3    # "newConnection":Z
    :cond_7
    sget-object v9, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, v1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 82
    sget-object v9, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v9, v12}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 83
    sget-object v9, Lio/socket/client/IO;->logger:Ljava/util/logging/Logger;

    const-string v12, "new io instance for %s"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v8, v10, v11

    invoke-static {v12, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 85
    :cond_8
    sget-object v9, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v10, Lio/socket/client/Manager;

    invoke-direct {v10, v8, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    invoke-virtual {v9, v1, v10}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_9
    sget-object v9, Lio/socket/client/IO;->managers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/socket/client/Manager;

    .restart local v2    # "io":Lio/socket/client/Manager;
    goto :goto_2
.end method
