.class public final Lokhttp3/internal/connection/StreamAllocation;
.super Ljava/lang/Object;
.source "StreamAllocation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field public final address:Lokhttp3/Address;

.field private final callStackTrace:Ljava/lang/Object;

.field private canceled:Z

.field private codec:Lokhttp3/internal/http/HttpCodec;

.field private connection:Lokhttp3/internal/connection/RealConnection;

.field private final connectionPool:Lokhttp3/ConnectionPool;

.field private refusedStreamCount:I

.field private released:Z

.field private route:Lokhttp3/Route;

.field private final routeSelector:Lokhttp3/internal/connection/RouteSelector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    const-class v0, Lokhttp3/internal/connection/StreamAllocation;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lokhttp3/internal/connection/StreamAllocation;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lokhttp3/ConnectionPool;Lokhttp3/Address;Ljava/lang/Object;)V
    .locals 2
    .param p1, "connectionPool"    # Lokhttp3/ConnectionPool;
    .param p2, "address"    # Lokhttp3/Address;
    .param p3, "callStackTrace"    # Ljava/lang/Object;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    .line 88
    iput-object p2, p0, Lokhttp3/internal/connection/StreamAllocation;->address:Lokhttp3/Address;

    .line 89
    new-instance v0, Lokhttp3/internal/connection/RouteSelector;

    invoke-direct {p0}, Lokhttp3/internal/connection/StreamAllocation;->routeDatabase()Lokhttp3/internal/connection/RouteDatabase;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lokhttp3/internal/connection/RouteSelector;-><init>(Lokhttp3/Address;Lokhttp3/internal/connection/RouteDatabase;)V

    iput-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    .line 90
    iput-object p3, p0, Lokhttp3/internal/connection/StreamAllocation;->callStackTrace:Ljava/lang/Object;

    .line 91
    return-void
.end method

.method private deallocate(ZZZ)Ljava/net/Socket;
    .locals 5
    .param p1, "noNewStreams"    # Z
    .param p2, "released"    # Z
    .param p3, "streamFinished"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 268
    sget-boolean v1, Lokhttp3/internal/connection/StreamAllocation;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 270
    :cond_0
    if-eqz p3, :cond_1

    .line 271
    iput-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    .line 273
    :cond_1
    if-eqz p2, :cond_2

    .line 274
    iput-boolean v2, p0, Lokhttp3/internal/connection/StreamAllocation;->released:Z

    .line 276
    :cond_2
    const/4 v0, 0x0

    .line 277
    .local v0, "socket":Ljava/net/Socket;
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    if-eqz v1, :cond_6

    .line 278
    if-eqz p1, :cond_3

    .line 279
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iput-boolean v2, v1, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    .line 281
    :cond_3
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    if-nez v1, :cond_6

    iget-boolean v1, p0, Lokhttp3/internal/connection/StreamAllocation;->released:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget-boolean v1, v1, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    if-eqz v1, :cond_6

    .line 282
    :cond_4
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    invoke-direct {p0, v1}, Lokhttp3/internal/connection/StreamAllocation;->release(Lokhttp3/internal/connection/RealConnection;)V

    .line 283
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget-object v1, v1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 284
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, v1, Lokhttp3/internal/connection/RealConnection;->idleAtNanos:J

    .line 285
    sget-object v1, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    iget-object v3, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    invoke-virtual {v1, v2, v3}, Lokhttp3/internal/Internal;->connectionBecameIdle(Lokhttp3/ConnectionPool;Lokhttp3/internal/connection/RealConnection;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 286
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v0

    .line 289
    :cond_5
    iput-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 292
    :cond_6
    return-object v0
.end method

.method private findConnection(IIIZ)Lokhttp3/internal/connection/RealConnection;
    .locals 9
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionRetryEnabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v5, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v5

    .line 150
    :try_start_0
    iget-boolean v4, p0, Lokhttp3/internal/connection/StreamAllocation;->released:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v6, "released"

    invoke-direct {v4, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 167
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 151
    :cond_0
    :try_start_1
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v6, "codec != null"

    invoke-direct {v4, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 152
    :cond_1
    iget-boolean v4, p0, Lokhttp3/internal/connection/StreamAllocation;->canceled:Z

    if-eqz v4, :cond_2

    new-instance v4, Ljava/io/IOException;

    const-string v6, "Canceled"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 155
    :cond_2
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 156
    .local v0, "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    if-eqz v0, :cond_3

    iget-boolean v4, v0, Lokhttp3/internal/connection/RealConnection;->noNewStreams:Z

    if-nez v4, :cond_3

    .line 157
    monitor-exit v5

    .line 212
    .end local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :goto_0
    return-object v0

    .line 161
    .restart local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :cond_3
    sget-object v4, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v6, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    iget-object v7, p0, Lokhttp3/internal/connection/StreamAllocation;->address:Lokhttp3/Address;

    const/4 v8, 0x0

    invoke-virtual {v4, v6, v7, p0, v8}, Lokhttp3/internal/Internal;->get(Lokhttp3/ConnectionPool;Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/Route;)Lokhttp3/internal/connection/RealConnection;

    .line 162
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    if-eqz v4, :cond_4

    .line 163
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .end local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    monitor-exit v5

    goto :goto_0

    .line 166
    .restart local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :cond_4
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    .line 167
    .local v2, "selectedRoute":Lokhttp3/Route;
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    if-nez v2, :cond_5

    .line 171
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    invoke-virtual {v4}, Lokhttp3/internal/connection/RouteSelector;->next()Lokhttp3/Route;

    move-result-object v2

    .line 175
    :cond_5
    iget-object v5, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v5

    .line 176
    :try_start_2
    iget-boolean v4, p0, Lokhttp3/internal/connection/StreamAllocation;->canceled:Z

    if-eqz v4, :cond_6

    new-instance v4, Ljava/io/IOException;

    const-string v6, "Canceled"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 192
    .end local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v4

    .line 180
    .restart local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :cond_6
    :try_start_3
    sget-object v4, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v6, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    iget-object v7, p0, Lokhttp3/internal/connection/StreamAllocation;->address:Lokhttp3/Address;

    invoke-virtual {v4, v6, v7, p0, v2}, Lokhttp3/internal/Internal;->get(Lokhttp3/ConnectionPool;Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;Lokhttp3/Route;)Lokhttp3/internal/connection/RealConnection;

    .line 181
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    if-eqz v4, :cond_7

    .line 182
    iput-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    .line 183
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .end local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    monitor-exit v5

    goto :goto_0

    .line 188
    .restart local v0    # "allocatedConnection":Lokhttp3/internal/connection/RealConnection;
    :cond_7
    iput-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    .line 189
    const/4 v4, 0x0

    iput v4, p0, Lokhttp3/internal/connection/StreamAllocation;->refusedStreamCount:I

    .line 190
    new-instance v1, Lokhttp3/internal/connection/RealConnection;

    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-direct {v1, v4, v2}, Lokhttp3/internal/connection/RealConnection;-><init>(Lokhttp3/ConnectionPool;Lokhttp3/Route;)V

    .line 191
    .local v1, "result":Lokhttp3/internal/connection/RealConnection;
    invoke-virtual {p0, v1}, Lokhttp3/internal/connection/StreamAllocation;->acquire(Lokhttp3/internal/connection/RealConnection;)V

    .line 192
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 195
    invoke-virtual {v1, p1, p2, p3, p4}, Lokhttp3/internal/connection/RealConnection;->connect(IIIZ)V

    .line 196
    invoke-direct {p0}, Lokhttp3/internal/connection/StreamAllocation;->routeDatabase()Lokhttp3/internal/connection/RouteDatabase;

    move-result-object v4

    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->route()Lokhttp3/Route;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/internal/connection/RouteDatabase;->connected(Lokhttp3/Route;)V

    .line 198
    const/4 v3, 0x0

    .line 199
    .local v3, "socket":Ljava/net/Socket;
    iget-object v5, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v5

    .line 201
    :try_start_4
    sget-object v4, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v6, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-virtual {v4, v6, v1}, Lokhttp3/internal/Internal;->put(Lokhttp3/ConnectionPool;Lokhttp3/internal/connection/RealConnection;)V

    .line 205
    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 206
    sget-object v4, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v6, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    iget-object v7, p0, Lokhttp3/internal/connection/StreamAllocation;->address:Lokhttp3/Address;

    invoke-virtual {v4, v6, v7, p0}, Lokhttp3/internal/Internal;->deduplicate(Lokhttp3/ConnectionPool;Lokhttp3/Address;Lokhttp3/internal/connection/StreamAllocation;)Ljava/net/Socket;

    move-result-object v3

    .line 207
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 209
    :cond_8
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 210
    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    move-object v0, v1

    .line 212
    goto/16 :goto_0

    .line 209
    :catchall_2
    move-exception v4

    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v4
.end method

.method private findHealthyConnection(IIIZZ)Lokhttp3/internal/connection/RealConnection;
    .locals 3
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionRetryEnabled"    # Z
    .param p5, "doExtensiveHealthChecks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lokhttp3/internal/connection/StreamAllocation;->findConnection(IIIZ)Lokhttp3/internal/connection/RealConnection;

    move-result-object v0

    .line 125
    .local v0, "candidate":Lokhttp3/internal/connection/RealConnection;
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v2

    .line 126
    :try_start_0
    iget v1, v0, Lokhttp3/internal/connection/RealConnection;->successCount:I

    if-nez v1, :cond_1

    .line 127
    monitor-exit v2

    .line 138
    :cond_0
    return-object v0

    .line 129
    :cond_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    invoke-virtual {v0, p5}, Lokhttp3/internal/connection/RealConnection;->isHealthy(Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    invoke-virtual {p0}, Lokhttp3/internal/connection/StreamAllocation;->noNewStreams()V

    goto :goto_0

    .line 129
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private release(Lokhttp3/internal/connection/RealConnection;)V
    .locals 4
    .param p1, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .prologue
    .line 358
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 359
    iget-object v3, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/Reference;

    .line 360
    .local v1, "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;"
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_0

    .line 361
    iget-object v3, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 362
    return-void

    .line 358
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 365
    .end local v1    # "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;"
    :cond_1
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3
.end method

.method private routeDatabase()Lokhttp3/internal/connection/RouteDatabase;
    .locals 2

    .prologue
    .line 236
    sget-object v0, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-virtual {v0, v1}, Lokhttp3/internal/Internal;->routeDatabase(Lokhttp3/ConnectionPool;)Lokhttp3/internal/connection/RouteDatabase;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public acquire(Lokhttp3/internal/connection/RealConnection;)V
    .locals 3
    .param p1, "connection"    # Lokhttp3/internal/connection/RealConnection;

    .prologue
    .line 349
    sget-boolean v0, Lokhttp3/internal/connection/StreamAllocation;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 350
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 352
    :cond_1
    iput-object p1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 353
    iget-object v0, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    new-instance v1, Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;

    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->callStackTrace:Ljava/lang/Object;

    invoke-direct {v1, p0, v2}, Lokhttp3/internal/connection/StreamAllocation$StreamAllocationReference;-><init>(Lokhttp3/internal/connection/StreamAllocation;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    return-void
.end method

.method public cancel()V
    .locals 4

    .prologue
    .line 298
    iget-object v3, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v3

    .line 299
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lokhttp3/internal/connection/StreamAllocation;->canceled:Z

    .line 300
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    .line 301
    .local v0, "codecToCancel":Lokhttp3/internal/http/HttpCodec;
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 302
    .local v1, "connectionToCancel":Lokhttp3/internal/connection/RealConnection;
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    if-eqz v0, :cond_1

    .line 304
    invoke-interface {v0}, Lokhttp3/internal/http/HttpCodec;->cancel()V

    .line 308
    :cond_0
    :goto_0
    return-void

    .line 302
    .end local v0    # "codecToCancel":Lokhttp3/internal/http/HttpCodec;
    .end local v1    # "connectionToCancel":Lokhttp3/internal/connection/RealConnection;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 305
    .restart local v0    # "codecToCancel":Lokhttp3/internal/http/HttpCodec;
    .restart local v1    # "connectionToCancel":Lokhttp3/internal/connection/RealConnection;
    :cond_1
    if-eqz v1, :cond_0

    .line 306
    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->cancel()V

    goto :goto_0
.end method

.method public codec()Lokhttp3/internal/http/HttpCodec;
    .locals 2

    .prologue
    .line 230
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v1

    .line 231
    :try_start_0
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    monitor-exit v1

    return-object v0

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public declared-synchronized connection()Lokhttp3/internal/connection/RealConnection;
    .locals 1

    .prologue
    .line 240
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hasMoreRoutes()Z
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    if-nez v0, :cond_0

    iget-object v0, p0, Lokhttp3/internal/connection/StreamAllocation;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    invoke-virtual {v0}, Lokhttp3/internal/connection/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public newStream(Lokhttp3/OkHttpClient;Z)Lokhttp3/internal/http/HttpCodec;
    .locals 9
    .param p1, "client"    # Lokhttp3/OkHttpClient;
    .param p2, "doExtensiveHealthChecks"    # Z

    .prologue
    .line 94
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->connectTimeoutMillis()I

    move-result v1

    .line 95
    .local v1, "connectTimeout":I
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->readTimeoutMillis()I

    move-result v2

    .line 96
    .local v2, "readTimeout":I
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->writeTimeoutMillis()I

    move-result v3

    .line 97
    .local v3, "writeTimeout":I
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    move-result v4

    .local v4, "connectionRetryEnabled":Z
    move-object v0, p0

    move v5, p2

    .line 100
    :try_start_0
    invoke-direct/range {v0 .. v5}, Lokhttp3/internal/connection/StreamAllocation;->findHealthyConnection(IIIZZ)Lokhttp3/internal/connection/RealConnection;

    move-result-object v8

    .line 102
    .local v8, "resultConnection":Lokhttp3/internal/connection/RealConnection;
    invoke-virtual {v8, p1, p0}, Lokhttp3/internal/connection/RealConnection;->newCodec(Lokhttp3/OkHttpClient;Lokhttp3/internal/connection/StreamAllocation;)Lokhttp3/internal/http/HttpCodec;

    move-result-object v7

    .line 104
    .local v7, "resultCodec":Lokhttp3/internal/http/HttpCodec;
    iget-object v5, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :try_start_1
    iput-object v7, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    .line 106
    monitor-exit v5

    return-object v7

    .line 107
    :catchall_0
    move-exception v0

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 108
    .end local v7    # "resultCodec":Lokhttp3/internal/http/HttpCodec;
    .end local v8    # "resultConnection":Lokhttp3/internal/connection/RealConnection;
    :catch_0
    move-exception v6

    .line 109
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lokhttp3/internal/connection/RouteException;

    invoke-direct {v0, v6}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public noNewStreams()V
    .locals 5

    .prologue
    .line 254
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v2

    .line 255
    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_0
    invoke-direct {p0, v1, v3, v4}, Lokhttp3/internal/connection/StreamAllocation;->deallocate(ZZZ)Ljava/net/Socket;

    move-result-object v0

    .line 256
    .local v0, "socket":Ljava/net/Socket;
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 258
    return-void

    .line 256
    .end local v0    # "socket":Ljava/net/Socket;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public release()V
    .locals 5

    .prologue
    .line 245
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v2

    .line 246
    const/4 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    :try_start_0
    invoke-direct {p0, v1, v3, v4}, Lokhttp3/internal/connection/StreamAllocation;->deallocate(ZZZ)Ljava/net/Socket;

    move-result-object v0

    .line 247
    .local v0, "socket":Ljava/net/Socket;
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 249
    return-void

    .line 247
    .end local v0    # "socket":Ljava/net/Socket;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public releaseAndAcquire(Lokhttp3/internal/connection/RealConnection;)Ljava/net/Socket;
    .locals 5
    .param p1, "newConnection"    # Lokhttp3/internal/connection/RealConnection;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 377
    sget-boolean v2, Lokhttp3/internal/connection/StreamAllocation;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    invoke-static {v2}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 378
    :cond_0
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    if-nez v2, :cond_1

    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget-object v2, v2, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v2, v4, :cond_2

    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 381
    :cond_2
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget-object v2, v2, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 382
    .local v0, "onlyAllocation":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lokhttp3/internal/connection/StreamAllocation;>;"
    invoke-direct {p0, v4, v3, v3}, Lokhttp3/internal/connection/StreamAllocation;->deallocate(ZZZ)Ljava/net/Socket;

    move-result-object v1

    .line 385
    .local v1, "socket":Ljava/net/Socket;
    iput-object p1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 386
    iget-object v2, p1, Lokhttp3/internal/connection/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 388
    return-object v1
.end method

.method public streamFailed(Ljava/io/IOException;)V
    .locals 8
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v7, 0x1

    .line 312
    const/4 v1, 0x0

    .line 314
    .local v1, "noNewStreams":Z
    iget-object v5, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v5

    .line 315
    :try_start_0
    instance-of v4, p1, Lokhttp3/internal/http2/StreamResetException;

    if-eqz v4, :cond_3

    .line 316
    move-object v0, p1

    check-cast v0, Lokhttp3/internal/http2/StreamResetException;

    move-object v3, v0

    .line 317
    .local v3, "streamResetException":Lokhttp3/internal/http2/StreamResetException;
    iget-object v4, v3, Lokhttp3/internal/http2/StreamResetException;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    sget-object v6, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    if-ne v4, v6, :cond_0

    .line 318
    iget v4, p0, Lokhttp3/internal/connection/StreamAllocation;->refusedStreamCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lokhttp3/internal/connection/StreamAllocation;->refusedStreamCount:I

    .line 322
    :cond_0
    iget-object v4, v3, Lokhttp3/internal/http2/StreamResetException;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    sget-object v6, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    if-ne v4, v6, :cond_1

    iget v4, p0, Lokhttp3/internal/connection/StreamAllocation;->refusedStreamCount:I

    if-le v4, v7, :cond_2

    .line 323
    :cond_1
    const/4 v1, 0x1

    .line 324
    const/4 v4, 0x0

    iput-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    .line 338
    .end local v3    # "streamResetException":Lokhttp3/internal/http2/StreamResetException;
    :cond_2
    :goto_0
    const/4 v4, 0x0

    const/4 v6, 0x1

    invoke-direct {p0, v1, v4, v6}, Lokhttp3/internal/connection/StreamAllocation;->deallocate(ZZZ)Ljava/net/Socket;

    move-result-object v2

    .line 339
    .local v2, "socket":Ljava/net/Socket;
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 341
    invoke-static {v2}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 342
    return-void

    .line 326
    .end local v2    # "socket":Ljava/net/Socket;
    :cond_3
    :try_start_1
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 327
    invoke-virtual {v4}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    move-result v4

    if-eqz v4, :cond_4

    instance-of v4, p1, Lokhttp3/internal/http2/ConnectionShutdownException;

    if-eqz v4, :cond_2

    .line 328
    :cond_4
    const/4 v1, 0x1

    .line 331
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget v4, v4, Lokhttp3/internal/connection/RealConnection;->successCount:I

    if-nez v4, :cond_2

    .line 332
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    if-eqz v4, :cond_5

    if-eqz p1, :cond_5

    .line 333
    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    iget-object v6, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    invoke-virtual {v4, v6, p1}, Lokhttp3/internal/connection/RouteSelector;->connectFailed(Lokhttp3/Route;Ljava/io/IOException;)V

    .line 335
    :cond_5
    const/4 v4, 0x0

    iput-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->route:Lokhttp3/Route;

    goto :goto_0

    .line 339
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method public streamFinished(ZLokhttp3/internal/http/HttpCodec;)V
    .locals 5
    .param p1, "noNewStreams"    # Z
    .param p2, "codec"    # Lokhttp3/internal/http/HttpCodec;

    .prologue
    .line 217
    iget-object v2, p0, Lokhttp3/internal/connection/StreamAllocation;->connectionPool:Lokhttp3/ConnectionPool;

    monitor-enter v2

    .line 218
    if-eqz p2, :cond_0

    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    if-eq p2, v1, :cond_1

    .line 219
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lokhttp3/internal/connection/StreamAllocation;->codec:Lokhttp3/internal/http/HttpCodec;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " but was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 225
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 221
    :cond_1
    if-nez p1, :cond_2

    .line 222
    :try_start_1
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->connection:Lokhttp3/internal/connection/RealConnection;

    iget v3, v1, Lokhttp3/internal/connection/RealConnection;->successCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, Lokhttp3/internal/connection/RealConnection;->successCount:I

    .line 224
    :cond_2
    const/4 v1, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, p1, v1, v3}, Lokhttp3/internal/connection/StreamAllocation;->deallocate(ZZZ)Ljava/net/Socket;

    move-result-object v0

    .line 225
    .local v0, "socket":Ljava/net/Socket;
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 226
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 227
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 396
    invoke-virtual {p0}, Lokhttp3/internal/connection/StreamAllocation;->connection()Lokhttp3/internal/connection/RealConnection;

    move-result-object v0

    .line 397
    .local v0, "connection":Lokhttp3/internal/connection/RealConnection;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lokhttp3/internal/connection/RealConnection;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lokhttp3/internal/connection/StreamAllocation;->address:Lokhttp3/Address;

    invoke-virtual {v1}, Lokhttp3/Address;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
