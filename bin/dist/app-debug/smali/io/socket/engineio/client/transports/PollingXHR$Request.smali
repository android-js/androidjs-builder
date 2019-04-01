.class public Lio/socket/engineio/client/transports/PollingXHR$Request;
.super Lio/socket/emitter/Emitter;
.source "PollingXHR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/transports/PollingXHR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
    }
.end annotation


# static fields
.field private static final BINARY_CONTENT_TYPE:Ljava/lang/String; = "application/octet-stream"

.field private static final BINARY_MEDIA_TYPE:Lokhttp3/MediaType;

.field public static final EVENT_DATA:Ljava/lang/String; = "data"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_REQUEST_HEADERS:Ljava/lang/String; = "requestHeaders"

.field public static final EVENT_RESPONSE_HEADERS:Ljava/lang/String; = "responseHeaders"

.field public static final EVENT_SUCCESS:Ljava/lang/String; = "success"

.field private static final TEXT_CONTENT_TYPE:Ljava/lang/String; = "text/plain;charset=UTF-8"

.field private static final TEXT_MEDIA_TYPE:Lokhttp3/MediaType;


# instance fields
.field private callFactory:Lokhttp3/Call$Factory;

.field private data:Ljava/lang/Object;

.field private method:Ljava/lang/String;

.field private requestCall:Lokhttp3/Call;

.field private response:Lokhttp3/Response;

.field private uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 159
    const-string v0, "application/octet-stream"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/PollingXHR$Request;->BINARY_MEDIA_TYPE:Lokhttp3/MediaType;

    .line 160
    const-string v0, "text/plain;charset=UTF-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/PollingXHR$Request;->TEXT_MEDIA_TYPE:Lokhttp3/MediaType;

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    .prologue
    .line 171
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 172
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    :goto_0
    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    .line 173
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->uri:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    .line 174
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->data:Ljava/lang/Object;

    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    .line 175
    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->callFactory:Lokhttp3/Call$Factory;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->callFactory:Lokhttp3/Call$Factory;

    :goto_1
    iput-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->callFactory:Lokhttp3/Call$Factory;

    .line 176
    return-void

    .line 172
    :cond_0
    const-string v0, "GET"

    goto :goto_0

    .line 175
    :cond_1
    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    goto :goto_1
.end method

.method static synthetic access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$502(Lio/socket/engineio/client/transports/PollingXHR$Request;Lokhttp3/Response;)Lokhttp3/Response;
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;
    .param p1, "x1"    # Lokhttp3/Response;

    .prologue
    .line 148
    iput-object p1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->response:Lokhttp3/Response;

    return-object p1
.end method

.method static synthetic access$600(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onResponseHeaders(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .prologue
    .line 148
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onLoad()V

    return-void
.end method

.method private onData(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 248
    const-string v0, "data"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 249
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onSuccess()V

    .line 250
    return-void
.end method

.method private onData([B)V
    .locals 3
    .param p1, "data"    # [B

    .prologue
    .line 253
    const-string v0, "data"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 254
    invoke-direct {p0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onSuccess()V

    .line 255
    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "err"    # Ljava/lang/Exception;

    .prologue
    .line 258
    const-string v0, "error"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 259
    return-void
.end method

.method private onLoad()V
    .locals 4

    .prologue
    .line 270
    iget-object v3, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->response:Lokhttp3/Response;

    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    .line 271
    .local v0, "body":Lokhttp3/ResponseBody;
    invoke-virtual {v0}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v1

    .line 274
    .local v1, "contentType":Ljava/lang/String;
    :try_start_0
    const-string v3, "application/octet-stream"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 275
    invoke-virtual {v0}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v3

    invoke-direct {p0, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onData([B)V

    .line 282
    :goto_0
    return-void

    .line 277
    :cond_0
    invoke-virtual {v0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onData(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 279
    :catch_0
    move-exception v2

    .line 280
    .local v2, "e":Ljava/io/IOException;
    invoke-direct {p0, v2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private onRequestHeaders(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v0, "requestHeaders"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 263
    return-void
.end method

.method private onResponseHeaders(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v0, "responseHeaders"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 267
    return-void
.end method

.method private onSuccess()V
    .locals 2

    .prologue
    .line 244
    const-string v0, "success"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 245
    return-void
.end method


# virtual methods
.method public create()V
    .locals 14

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 179
    move-object v5, p0

    .line 180
    .local v5, "self":Lio/socket/engineio/client/transports/PollingXHR$Request;
    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$200()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$300()Ljava/util/logging/Logger;

    move-result-object v7

    const-string v8, "xhr open %s: %s"

    new-array v9, v13, [Ljava/lang/Object;

    iget-object v10, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    aput-object v10, v9, v11

    iget-object v10, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 181
    :cond_0
    new-instance v2, Ljava/util/TreeMap;

    sget-object v7, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v2, v7}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 183
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v7, "POST"

    iget-object v8, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 184
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    instance-of v7, v7, [B

    if-eqz v7, :cond_4

    .line 185
    const-string v7, "Content-type"

    new-instance v8, Ljava/util/LinkedList;

    const-string v9, "application/octet-stream"

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    :cond_1
    :goto_0
    const-string v7, "Accept"

    new-instance v8, Ljava/util/LinkedList;

    const-string v9, "*/*"

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    invoke-direct {p0, v2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->onRequestHeaders(Ljava/util/Map;)V

    .line 195
    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$200()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 196
    invoke-static {}, Lio/socket/engineio/client/transports/PollingXHR;->access$300()Ljava/util/logging/Logger;

    move-result-object v8

    const-string v9, "sending xhr with url %s | data %s"

    new-array v10, v13, [Ljava/lang/Object;

    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    aput-object v7, v10, v11

    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    instance-of v7, v7, [B

    if-eqz v7, :cond_5

    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    check-cast v7, [B

    check-cast v7, [B

    .line 197
    invoke-static {v7}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v7

    :goto_1
    aput-object v7, v10, v12

    .line 196
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 200
    :cond_2
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    .line 201
    .local v4, "requestBuilder":Lokhttp3/Request$Builder;
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 202
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 203
    .local v6, "v":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7, v6}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_2

    .line 187
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v4    # "requestBuilder":Lokhttp3/Request$Builder;
    .end local v6    # "v":Ljava/lang/String;
    :cond_4
    const-string v7, "Content-type"

    new-instance v8, Ljava/util/LinkedList;

    const-string v9, "text/plain;charset=UTF-8"

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 197
    :cond_5
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    goto :goto_1

    .line 206
    .restart local v4    # "requestBuilder":Lokhttp3/Request$Builder;
    :cond_6
    const/4 v0, 0x0

    .line 207
    .local v0, "body":Lokhttp3/RequestBody;
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    instance-of v7, v7, [B

    if-eqz v7, :cond_8

    .line 208
    sget-object v8, Lio/socket/engineio/client/transports/PollingXHR$Request;->BINARY_MEDIA_TYPE:Lokhttp3/MediaType;

    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    check-cast v7, [B

    check-cast v7, [B

    invoke-static {v8, v7}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v0

    .line 213
    :cond_7
    :goto_3
    iget-object v7, v5, Lio/socket/engineio/client/transports/PollingXHR$Request;->uri:Ljava/lang/String;

    .line 214
    invoke-static {v7}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v4, v7}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v7

    iget-object v8, v5, Lio/socket/engineio/client/transports/PollingXHR$Request;->method:Ljava/lang/String;

    .line 215
    invoke-virtual {v7, v8, v0}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v7

    .line 216
    invoke-virtual {v7}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    .line 218
    .local v3, "request":Lokhttp3/Request;
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->callFactory:Lokhttp3/Call$Factory;

    invoke-interface {v7, v3}, Lokhttp3/Call$Factory;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v7

    iput-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->requestCall:Lokhttp3/Call;

    .line 219
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->requestCall:Lokhttp3/Call;

    new-instance v8, Lio/socket/engineio/client/transports/PollingXHR$Request$1;

    invoke-direct {v8, p0, v5}, Lio/socket/engineio/client/transports/PollingXHR$Request$1;-><init>(Lio/socket/engineio/client/transports/PollingXHR$Request;Lio/socket/engineio/client/transports/PollingXHR$Request;)V

    invoke-interface {v7, v8}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 241
    return-void

    .line 209
    .end local v3    # "request":Lokhttp3/Request;
    :cond_8
    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    instance-of v7, v7, Ljava/lang/String;

    if-eqz v7, :cond_7

    .line 210
    sget-object v8, Lio/socket/engineio/client/transports/PollingXHR$Request;->TEXT_MEDIA_TYPE:Lokhttp3/MediaType;

    iget-object v7, p0, Lio/socket/engineio/client/transports/PollingXHR$Request;->data:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-static {v8, v7}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v0

    goto :goto_3
.end method
