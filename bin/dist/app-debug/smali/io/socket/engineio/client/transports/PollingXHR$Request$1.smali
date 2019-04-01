.class Lio/socket/engineio/client/transports/PollingXHR$Request$1;
.super Ljava/lang/Object;
.source "PollingXHR.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

.field final synthetic val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/PollingXHR$Request;Lio/socket/engineio/client/transports/PollingXHR$Request;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/PollingXHR$Request;

    .prologue
    .line 219
    iput-object p1, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->this$0:Lio/socket/engineio/client/transports/PollingXHR$Request;

    iput-object p2, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 1
    .param p1, "call"    # Lokhttp3/Call;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 222
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v0, p2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V

    .line 223
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 3
    .param p1, "call"    # Lokhttp3/Call;
    .param p2, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v0, p2}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$502(Lio/socket/engineio/client/transports/PollingXHR$Request;Lokhttp3/Response;)Lokhttp3/Response;

    .line 228
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v1

    invoke-static {v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$600(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/util/Map;)V

    .line 231
    :try_start_0
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-static {v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$700(Lio/socket/engineio/client/transports/PollingXHR$Request;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    :goto_0
    invoke-virtual {p2}, Lokhttp3/Response;->close()V

    .line 239
    return-void

    .line 234
    :cond_0
    :try_start_1
    iget-object v0, p0, Lio/socket/engineio/client/transports/PollingXHR$Request$1;->val$self:Lio/socket/engineio/client/transports/PollingXHR$Request;

    new-instance v1, Ljava/io/IOException;

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->access$400(Lio/socket/engineio/client/transports/PollingXHR$Request;Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v0

    invoke-virtual {p2}, Lokhttp3/Response;->close()V

    throw v0
.end method
