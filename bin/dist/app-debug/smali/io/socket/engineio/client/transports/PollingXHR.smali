.class public Lio/socket/engineio/client/transports/PollingXHR;
.super Lio/socket/engineio/client/transports/Polling;
.source "PollingXHR.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/transports/PollingXHR$Request;
    }
.end annotation


# static fields
.field private static LOGGABLE_FINE:Z

.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    const-class v0, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    .line 30
    sget-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    sput-boolean v0, Lio/socket/engineio/client/transports/PollingXHR;->LOGGABLE_FINE:Z

    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Transport$Options;)V
    .locals 0
    .param p1, "opts"    # Lio/socket/engineio/client/Transport$Options;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lio/socket/engineio/client/transports/Polling;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .line 34
    return-void
.end method

.method static synthetic access$000(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Exception;

    .prologue
    .line 26
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/transports/PollingXHR;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Exception;

    .prologue
    .line 26
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->onError(Ljava/lang/String;Ljava/lang/Exception;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Z
    .locals 1

    .prologue
    .line 26
    sget-boolean v0, Lio/socket/engineio/client/transports/PollingXHR;->LOGGABLE_FINE:Z

    return v0
.end method

.method static synthetic access$300()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private doWrite(Ljava/lang/Object;Ljava/lang/Runnable;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/Object;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 81
    new-instance v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    invoke-direct {v0}, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;-><init>()V

    .line 82
    .local v0, "opts":Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
    const-string v3, "POST"

    iput-object v3, v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->method:Ljava/lang/String;

    .line 83
    iput-object p1, v0, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->data:Ljava/lang/Object;

    .line 84
    invoke-virtual {p0, v0}, Lio/socket/engineio/client/transports/PollingXHR;->request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object v1

    .line 85
    .local v1, "req":Lio/socket/engineio/client/transports/PollingXHR$Request;
    move-object v2, p0

    .line 86
    .local v2, "self":Lio/socket/engineio/client/transports/PollingXHR;
    const-string v3, "success"

    new-instance v4, Lio/socket/engineio/client/transports/PollingXHR$3;

    invoke-direct {v4, p0, p2}, Lio/socket/engineio/client/transports/PollingXHR$3;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v3, v4}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 97
    const-string v3, "error"

    new-instance v4, Lio/socket/engineio/client/transports/PollingXHR$4;

    invoke-direct {v4, p0, v2}, Lio/socket/engineio/client/transports/PollingXHR$4;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    invoke-virtual {v1, v3, v4}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 109
    invoke-virtual {v1}, Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V

    .line 110
    return-void
.end method


# virtual methods
.method protected doPoll()V
    .locals 4

    .prologue
    .line 114
    sget-object v2, Lio/socket/engineio/client/transports/PollingXHR;->logger:Ljava/util/logging/Logger;

    const-string v3, "xhr poll"

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/PollingXHR;->request()Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object v0

    .line 116
    .local v0, "req":Lio/socket/engineio/client/transports/PollingXHR$Request;
    move-object v1, p0

    .line 117
    .local v1, "self":Lio/socket/engineio/client/transports/PollingXHR;
    const-string v2, "data"

    new-instance v3, Lio/socket/engineio/client/transports/PollingXHR$5;

    invoke-direct {v3, p0, v1}, Lio/socket/engineio/client/transports/PollingXHR$5;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    invoke-virtual {v0, v2, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 133
    const-string v2, "error"

    new-instance v3, Lio/socket/engineio/client/transports/PollingXHR$6;

    invoke-direct {v3, p0, v1}, Lio/socket/engineio/client/transports/PollingXHR$6;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    invoke-virtual {v0, v2, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 145
    invoke-virtual {v0}, Lio/socket/engineio/client/transports/PollingXHR$Request;->create()V

    .line 146
    return-void
.end method

.method protected doWrite(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 77
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->doWrite(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 78
    return-void
.end method

.method protected doWrite([BLjava/lang/Runnable;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/transports/PollingXHR;->doWrite(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 73
    return-void
.end method

.method protected request()Lio/socket/engineio/client/transports/PollingXHR$Request;
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/transports/PollingXHR;->request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;

    move-result-object v0

    return-object v0
.end method

.method protected request(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)Lio/socket/engineio/client/transports/PollingXHR$Request;
    .locals 5
    .param p1, "opts"    # Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    .prologue
    .line 41
    if-nez p1, :cond_0

    .line 42
    new-instance p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;

    .end local p1    # "opts":Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
    invoke-direct {p1}, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;-><init>()V

    .line 44
    .restart local p1    # "opts":Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
    :cond_0
    invoke-virtual {p0}, Lio/socket/engineio/client/transports/PollingXHR;->uri()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->uri:Ljava/lang/String;

    .line 45
    iget-object v2, p0, Lio/socket/engineio/client/transports/PollingXHR;->callFactory:Lokhttp3/Call$Factory;

    iput-object v2, p1, Lio/socket/engineio/client/transports/PollingXHR$Request$Options;->callFactory:Lokhttp3/Call$Factory;

    .line 47
    new-instance v0, Lio/socket/engineio/client/transports/PollingXHR$Request;

    invoke-direct {v0, p1}, Lio/socket/engineio/client/transports/PollingXHR$Request;-><init>(Lio/socket/engineio/client/transports/PollingXHR$Request$Options;)V

    .line 49
    .local v0, "req":Lio/socket/engineio/client/transports/PollingXHR$Request;
    move-object v1, p0

    .line 50
    .local v1, "self":Lio/socket/engineio/client/transports/PollingXHR;
    const-string v2, "requestHeaders"

    new-instance v3, Lio/socket/engineio/client/transports/PollingXHR$2;

    invoke-direct {v3, p0, v1}, Lio/socket/engineio/client/transports/PollingXHR$2;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    invoke-virtual {v0, v2, v3}, Lio/socket/engineio/client/transports/PollingXHR$Request;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v2

    const-string v3, "responseHeaders"

    new-instance v4, Lio/socket/engineio/client/transports/PollingXHR$1;

    invoke-direct {v4, p0, v1}, Lio/socket/engineio/client/transports/PollingXHR$1;-><init>(Lio/socket/engineio/client/transports/PollingXHR;Lio/socket/engineio/client/transports/PollingXHR;)V

    .line 56
    invoke-virtual {v2, v3, v4}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 67
    return-object v0
.end method
