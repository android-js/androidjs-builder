.class public final Lokhttp3/internal/http/CallServerInterceptor;
.super Ljava/lang/Object;
.source "CallServerInterceptor.java"

# interfaces
.implements Lokhttp3/Interceptor;


# instance fields
.field private final forWebSocket:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "forWebSocket"    # Z

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean p1, p0, Lokhttp3/internal/http/CallServerInterceptor;->forWebSocket:Z

    .line 36
    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 18
    .param p1, "chain"    # Lokhttp3/Interceptor$Chain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    move-object/from16 v6, p1

    check-cast v6, Lokhttp3/internal/http/RealInterceptorChain;

    .line 40
    .local v6, "realChain":Lokhttp3/internal/http/RealInterceptorChain;
    invoke-virtual {v6}, Lokhttp3/internal/http/RealInterceptorChain;->httpStream()Lokhttp3/internal/http/HttpCodec;

    move-result-object v5

    .line 41
    .local v5, "httpCodec":Lokhttp3/internal/http/HttpCodec;
    invoke-virtual {v6}, Lokhttp3/internal/http/RealInterceptorChain;->streamAllocation()Lokhttp3/internal/connection/StreamAllocation;

    move-result-object v11

    .line 42
    .local v11, "streamAllocation":Lokhttp3/internal/connection/StreamAllocation;
    invoke-virtual {v6}, Lokhttp3/internal/http/RealInterceptorChain;->connection()Lokhttp3/Connection;

    move-result-object v4

    check-cast v4, Lokhttp3/internal/connection/RealConnection;

    .line 43
    .local v4, "connection":Lokhttp3/internal/connection/RealConnection;
    invoke-virtual {v6}, Lokhttp3/internal/http/RealInterceptorChain;->request()Lokhttp3/Request;

    move-result-object v7

    .line 45
    .local v7, "request":Lokhttp3/Request;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 46
    .local v12, "sentRequestMillis":J
    invoke-interface {v5, v7}, Lokhttp3/internal/http/HttpCodec;->writeRequestHeaders(Lokhttp3/Request;)V

    .line 48
    const/4 v10, 0x0

    .line 49
    .local v10, "responseBuilder":Lokhttp3/Response$Builder;
    invoke-virtual {v7}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-virtual {v7}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v14

    if-eqz v14, :cond_1

    .line 53
    const-string v14, "100-continue"

    const-string v15, "Expect"

    invoke-virtual {v7, v15}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 54
    invoke-interface {v5}, Lokhttp3/internal/http/HttpCodec;->flushRequest()V

    .line 55
    const/4 v14, 0x1

    invoke-interface {v5, v14}, Lokhttp3/internal/http/HttpCodec;->readResponseHeaders(Z)Lokhttp3/Response$Builder;

    move-result-object v10

    .line 58
    :cond_0
    if-nez v10, :cond_6

    .line 60
    invoke-virtual {v7}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v14

    invoke-virtual {v14}, Lokhttp3/RequestBody;->contentLength()J

    move-result-wide v14

    invoke-interface {v5, v7, v14, v15}, Lokhttp3/internal/http/HttpCodec;->createRequestBody(Lokhttp3/Request;J)Lokio/Sink;

    move-result-object v8

    .line 61
    .local v8, "requestBodyOut":Lokio/Sink;
    invoke-static {v8}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v2

    .line 62
    .local v2, "bufferedRequestBody":Lokio/BufferedSink;
    invoke-virtual {v7}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v14

    invoke-virtual {v14, v2}, Lokhttp3/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 63
    invoke-interface {v2}, Lokio/BufferedSink;->close()V

    .line 72
    .end local v2    # "bufferedRequestBody":Lokio/BufferedSink;
    .end local v8    # "requestBodyOut":Lokio/Sink;
    :cond_1
    :goto_0
    invoke-interface {v5}, Lokhttp3/internal/http/HttpCodec;->finishRequest()V

    .line 74
    if-nez v10, :cond_2

    .line 75
    const/4 v14, 0x0

    invoke-interface {v5, v14}, Lokhttp3/internal/http/HttpCodec;->readResponseHeaders(Z)Lokhttp3/Response$Builder;

    move-result-object v10

    .line 79
    :cond_2
    invoke-virtual {v10, v7}, Lokhttp3/Response$Builder;->request(Lokhttp3/Request;)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 80
    invoke-virtual {v11}, Lokhttp3/internal/connection/StreamAllocation;->connection()Lokhttp3/internal/connection/RealConnection;

    move-result-object v15

    invoke-virtual {v15}, Lokhttp3/internal/connection/RealConnection;->handshake()Lokhttp3/Handshake;

    move-result-object v15

    invoke-virtual {v14, v15}, Lokhttp3/Response$Builder;->handshake(Lokhttp3/Handshake;)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 81
    invoke-virtual {v14, v12, v13}, Lokhttp3/Response$Builder;->sentRequestAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Lokhttp3/Response$Builder;->receivedResponseAtMillis(J)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 83
    invoke-virtual {v14}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    .line 85
    .local v9, "response":Lokhttp3/Response;
    invoke-virtual {v9}, Lokhttp3/Response;->code()I

    move-result v3

    .line 86
    .local v3, "code":I
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lokhttp3/internal/http/CallServerInterceptor;->forWebSocket:Z

    if-eqz v14, :cond_7

    const/16 v14, 0x65

    if-ne v3, v14, :cond_7

    .line 88
    invoke-virtual {v9}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v14

    sget-object v15, Lokhttp3/internal/Util;->EMPTY_RESPONSE:Lokhttp3/ResponseBody;

    .line 89
    invoke-virtual {v14, v15}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 90
    invoke-virtual {v14}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    .line 97
    :goto_1
    const-string v14, "close"

    invoke-virtual {v9}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v15

    const-string v16, "Connection"

    invoke-virtual/range {v15 .. v16}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    const-string v14, "close"

    const-string v15, "Connection"

    .line 98
    invoke-virtual {v9, v15}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 99
    :cond_3
    invoke-virtual {v11}, Lokhttp3/internal/connection/StreamAllocation;->noNewStreams()V

    .line 102
    :cond_4
    const/16 v14, 0xcc

    if-eq v3, v14, :cond_5

    const/16 v14, 0xcd

    if-ne v3, v14, :cond_8

    :cond_5
    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v14

    invoke-virtual {v14}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-lez v14, :cond_8

    .line 103
    new-instance v14, Ljava/net/ProtocolException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "HTTP "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " had non-zero Content-Length: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 104
    invoke-virtual {v9}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 64
    .end local v3    # "code":I
    .end local v9    # "response":Lokhttp3/Response;
    :cond_6
    invoke-virtual {v4}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    move-result v14

    if-nez v14, :cond_1

    .line 68
    invoke-virtual {v11}, Lokhttp3/internal/connection/StreamAllocation;->noNewStreams()V

    goto/16 :goto_0

    .line 92
    .restart local v3    # "code":I
    .restart local v9    # "response":Lokhttp3/Response;
    :cond_7
    invoke-virtual {v9}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v14

    .line 93
    invoke-interface {v5, v9}, Lokhttp3/internal/http/HttpCodec;->openResponseBody(Lokhttp3/Response;)Lokhttp3/ResponseBody;

    move-result-object v15

    invoke-virtual {v14, v15}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v14

    .line 94
    invoke-virtual {v14}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v9

    goto :goto_1

    .line 107
    :cond_8
    return-object v9
.end method
