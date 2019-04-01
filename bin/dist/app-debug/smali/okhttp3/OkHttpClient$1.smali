.class final Lokhttp3/OkHttpClient$1;
.super Lokhttp3/internal/Internal;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 130
    invoke-direct {p0}, Lokhttp3/internal/Internal;-><init>()V

    return-void
.end method


# virtual methods
.method public addLenient(Lokhttp3/Headers$Builder;Ljava/lang/String;)V
    .locals 0
    .param p1, "builder"    # Lokhttp3/Headers$Builder;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-virtual {p1, p2}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 133
    return-void
.end method

.method public addLenient(Lokhttp3/Headers$Builder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "builder"    # Lokhttp3/Headers$Builder;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-virtual {p1, p2, p3}, Lokhttp3/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 137
    return-void
.end method

.method public apply(Lokhttp3/ConnectionSpec;Ljavax/net/ssl/SSLSocket;Z)V
    .locals 0
    .param p1, "tlsConfiguration"    # Lokhttp3/ConnectionSpec;
    .param p2, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p3, "isFallback"    # Z

    .prologue
    .line 176
    invoke-virtual {p1, p2, p3}, Lokhttp3/ConnectionSpec;->apply(Ljavax/net/ssl/SSLSocket;Z)V

    .line 177
    return-void
.end method

.method public code(Lokhttp3/Response$Builder;)I
    .locals 1
    .param p1, "responseBuilder"    # Lokhttp3/Response$Builder;

    .prologue
    .line 171
    iget v0, p1, Lokhttp3/Response$Builder;->code:I

    return v0
.end method

.method public connectionBecameIdle(Lokhttp3/ConnectionPool;Lokhttp3/internal/connection/RealConnection;)Z
    .locals 1
    .param p1, "pool"    # Lokhttp3/ConnectionPool;
    .param p2, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .prologue
    .line 145
    invoke-virtual {p1, p2}, Lokhttp3/ConnectionPool;->connectionBecameIdle(Lokhttp3/internal/connection/RealConnection;)Z

    move-result v0

    return v0
.end method

.method public deduplicate(Lokhttp3/ConnectionPool;Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;)Ljava/net/Socket;
    .locals 1
    .param p1, "pool"    # Lokhttp3/ConnectionPool;
    .param p2, "address"    # Lokhttp3/Address;
    .param p3, "streamAllocation"    # Lokhttp3/internal/connection/StreamAllocation;

    .prologue
    .line 159
    invoke-virtual {p1, p2, p3}, Lokhttp3/ConnectionPool;->deduplicate(Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public equalsNonHost(Lokhttp3/Address;Lokhttp3/Address;)Z
    .locals 1
    .param p1, "a"    # Lokhttp3/Address;
    .param p2, "b"    # Lokhttp3/Address;

    .prologue
    .line 154
    invoke-virtual {p1, p2}, Lokhttp3/Address;->equalsNonHost(Lokhttp3/Address;)Z

    move-result v0

    return v0
.end method

.method public get(Lokhttp3/ConnectionPool;Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/Route;)Lokhttp3/internal/connection/RealConnection;
    .locals 1
    .param p1, "pool"    # Lokhttp3/ConnectionPool;
    .param p2, "address"    # Lokhttp3/Address;
    .param p3, "streamAllocation"    # Lokhttp3/internal/connection/StreamAllocation;
    .param p4, "route"    # Lokhttp3/Route;

    .prologue
    .line 150
    invoke-virtual {p1, p2, p3, p4}, Lokhttp3/ConnectionPool;->get(Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/Route;)Lokhttp3/internal/connection/RealConnection;

    move-result-object v0

    return-object v0
.end method

.method public getHttpUrlChecked(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-static {p1}, Lokhttp3/HttpUrl;->getChecked(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method public newWebSocketCall(Lokhttp3/OkHttpClient;Lokhttp3/Request;)Lokhttp3/Call;
    .locals 2
    .param p1, "client"    # Lokhttp3/OkHttpClient;
    .param p2, "originalRequest"    # Lokhttp3/Request;

    .prologue
    .line 189
    new-instance v0, Lokhttp3/RealCall;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lokhttp3/RealCall;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;Z)V

    return-object v0
.end method

.method public put(Lokhttp3/ConnectionPool;Lokhttp3/internal/connection/RealConnection;)V
    .locals 0
    .param p1, "pool"    # Lokhttp3/ConnectionPool;
    .param p2, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .prologue
    .line 163
    invoke-virtual {p1, p2}, Lokhttp3/ConnectionPool;->put(Lokhttp3/internal/connection/RealConnection;)V

    .line 164
    return-void
.end method

.method public routeDatabase(Lokhttp3/ConnectionPool;)Lokhttp3/internal/connection/RouteDatabase;
    .locals 1
    .param p1, "connectionPool"    # Lokhttp3/ConnectionPool;

    .prologue
    .line 167
    iget-object v0, p1, Lokhttp3/ConnectionPool;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    return-object v0
.end method

.method public setCache(Lokhttp3/OkHttpClient$Builder;Lokhttp3/internal/cache/InternalCache;)V
    .locals 0
    .param p1, "builder"    # Lokhttp3/OkHttpClient$Builder;
    .param p2, "internalCache"    # Lokhttp3/internal/cache/InternalCache;

    .prologue
    .line 140
    invoke-virtual {p1, p2}, Lokhttp3/OkHttpClient$Builder;->setInternalCache(Lokhttp3/internal/cache/InternalCache;)V

    .line 141
    return-void
.end method

.method public streamAllocation(Lokhttp3/Call;)Lokhttp3/internal/connection/StreamAllocation;
    .locals 1
    .param p1, "call"    # Lokhttp3/Call;

    .prologue
    .line 185
    check-cast p1, Lokhttp3/RealCall;

    .end local p1    # "call":Lokhttp3/Call;
    invoke-virtual {p1}, Lokhttp3/RealCall;->streamAllocation()Lokhttp3/internal/connection/StreamAllocation;

    move-result-object v0

    return-object v0
.end method
