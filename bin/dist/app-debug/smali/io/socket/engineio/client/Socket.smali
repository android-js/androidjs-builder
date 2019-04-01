.class public Lio/socket/engineio/client/Socket;
.super Lio/socket/emitter/Emitter;
.source "Socket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/engineio/client/Socket$Options;,
        Lio/socket/engineio/client/Socket$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_DATA:Ljava/lang/String; = "data"

.field public static final EVENT_DRAIN:Ljava/lang/String; = "drain"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_FLUSH:Ljava/lang/String; = "flush"

.field public static final EVENT_HANDSHAKE:Ljava/lang/String; = "handshake"

.field public static final EVENT_HEARTBEAT:Ljava/lang/String; = "heartbeat"

.field public static final EVENT_MESSAGE:Ljava/lang/String; = "message"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_PACKET_CREATE:Ljava/lang/String; = "packetCreate"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_TRANSPORT:Ljava/lang/String; = "transport"

.field public static final EVENT_UPGRADE:Ljava/lang/String; = "upgrade"

.field public static final EVENT_UPGRADE_ERROR:Ljava/lang/String; = "upgradeError"

.field public static final EVENT_UPGRADING:Ljava/lang/String; = "upgrading"

.field private static final PROBE_ERROR:Ljava/lang/String; = "probe error"

.field public static final PROTOCOL:I = 0x3

.field private static defaultCallFactory:Lokhttp3/Call$Factory;

.field private static defaultOkHttpClient:Lokhttp3/OkHttpClient;

.field private static defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

.field private static final logger:Ljava/util/logging/Logger;

.field private static priorWebsocketSuccess:Z


# instance fields
.field private callFactory:Lokhttp3/Call$Factory;

.field private heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field hostname:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private final onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

.field private path:Ljava/lang/String;

.field private pingInterval:J

.field private pingIntervalTimer:Ljava/util/concurrent/Future;

.field private pingTimeout:J

.field private pingTimeoutTimer:Ljava/util/concurrent/Future;

.field private policyPort:I

.field port:I

.field private prevBufferLen:I

.field private query:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private readyState:Lio/socket/engineio/client/Socket$ReadyState;

.field private rememberUpgrade:Z

.field private secure:Z

.field private timestampParam:Ljava/lang/String;

.field private timestampRequests:Z

.field transport:Lio/socket/engineio/client/Transport;

.field private transportOptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/socket/engineio/client/Transport$Options;",
            ">;"
        }
    .end annotation
.end field

.field private transports:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private upgrade:Z

.field private upgrades:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private upgrading:Z

.field private webSocketFactory:Lokhttp3/WebSocket$Factory;

.field writeBuffer:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lio/socket/engineio/parser/Packet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    .line 104
    const/4 v0, 0x0

    sput-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 145
    new-instance v0, Lio/socket/engineio/client/Socket$Options;

    invoke-direct {v0}, Lio/socket/engineio/client/Socket$Options;-><init>()V

    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    .line 146
    return-void
.end method

.method public constructor <init>(Lio/socket/engineio/client/Socket$Options;)V
    .locals 11
    .param p1, "opts"    # Lio/socket/engineio/client/Socket$Options;

    .prologue
    const/4 v10, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, -0x1

    .line 177
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 128
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 137
    new-instance v4, Lio/socket/engineio/client/Socket$1;

    invoke-direct {v4, p0}, Lio/socket/engineio/client/Socket$1;-><init>(Lio/socket/engineio/client/Socket;)V

    iput-object v4, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    .line 178
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 179
    iget-object v1, p1, Lio/socket/engineio/client/Socket$Options;->host:Ljava/lang/String;

    .line 180
    .local v1, "hostname":Ljava/lang/String;
    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-le v4, v10, :cond_8

    move v2, v5

    .line 181
    .local v2, "ipv6":Z
    :goto_0
    if-eqz v2, :cond_1

    .line 182
    const/16 v4, 0x5b

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 183
    .local v3, "start":I
    if-eq v3, v7, :cond_0

    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 184
    :cond_0
    const/16 v4, 0x5d

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 185
    .local v0, "end":I
    if-eq v0, v7, :cond_1

    invoke-virtual {v1, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 187
    .end local v0    # "end":I
    .end local v3    # "start":I
    :cond_1
    iput-object v1, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    .line 190
    .end local v1    # "hostname":Ljava/lang/String;
    .end local v2    # "ipv6":Z
    :cond_2
    iget-boolean v4, p1, Lio/socket/engineio/client/Socket$Options;->secure:Z

    iput-boolean v4, p0, Lio/socket/engineio/client/Socket;->secure:Z

    .line 192
    iget v4, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    if-ne v4, v7, :cond_3

    .line 194
    iget-boolean v4, p0, Lio/socket/engineio/client/Socket;->secure:Z

    if-eqz v4, :cond_9

    const/16 v4, 0x1bb

    :goto_1
    iput v4, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    .line 197
    :cond_3
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    if-eqz v4, :cond_a

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->hostname:Ljava/lang/String;

    :goto_2
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    .line 198
    iget v4, p1, Lio/socket/engineio/client/Socket$Options;->port:I

    iput v4, p0, Lio/socket/engineio/client/Socket;->port:I

    .line 199
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    if-eqz v4, :cond_b

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    .line 200
    invoke-static {v4}, Lio/socket/parseqs/ParseQS;->decode(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    :goto_3
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    .line 201
    iget-boolean v4, p1, Lio/socket/engineio/client/Socket$Options;->upgrade:Z

    iput-boolean v4, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    .line 202
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    if-eqz v4, :cond_c

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->path:Ljava/lang/String;

    :goto_4
    const-string v8, "/$"

    const-string v9, ""

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, "/"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lio/socket/engineio/client/Socket;->path:Ljava/lang/String;

    .line 203
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    if-eqz v4, :cond_d

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->timestampParam:Ljava/lang/String;

    :goto_5
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    .line 204
    iget-boolean v4, p1, Lio/socket/engineio/client/Socket$Options;->timestampRequests:Z

    iput-boolean v4, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    .line 205
    new-instance v7, Ljava/util/ArrayList;

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    if-eqz v4, :cond_e

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    :goto_6
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v7, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v7, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    .line 207
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transportOptions:Ljava/util/Map;

    if-eqz v4, :cond_f

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->transportOptions:Ljava/util/Map;

    :goto_7
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->transportOptions:Ljava/util/Map;

    .line 209
    iget v4, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    if-eqz v4, :cond_10

    iget v4, p1, Lio/socket/engineio/client/Socket$Options;->policyPort:I

    :goto_8
    iput v4, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    .line 210
    iget-boolean v4, p1, Lio/socket/engineio/client/Socket$Options;->rememberUpgrade:Z

    iput-boolean v4, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    .line 211
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->callFactory:Lokhttp3/Call$Factory;

    if-eqz v4, :cond_11

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->callFactory:Lokhttp3/Call$Factory;

    :goto_9
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    .line 212
    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-eqz v4, :cond_12

    iget-object v4, p1, Lio/socket/engineio/client/Socket$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    :goto_a
    iput-object v4, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 213
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    if-nez v4, :cond_5

    .line 214
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    if-nez v4, :cond_4

    .line 215
    new-instance v4, Lokhttp3/OkHttpClient;

    invoke-direct {v4}, Lokhttp3/OkHttpClient;-><init>()V

    sput-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    .line 217
    :cond_4
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    iput-object v4, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    .line 219
    :cond_5
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-nez v4, :cond_7

    .line 220
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    if-nez v4, :cond_6

    .line 221
    new-instance v4, Lokhttp3/OkHttpClient;

    invoke-direct {v4}, Lokhttp3/OkHttpClient;-><init>()V

    sput-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    .line 223
    :cond_6
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultOkHttpClient:Lokhttp3/OkHttpClient;

    iput-object v4, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 225
    :cond_7
    return-void

    .restart local v1    # "hostname":Ljava/lang/String;
    :cond_8
    move v2, v6

    .line 180
    goto/16 :goto_0

    .line 194
    .end local v1    # "hostname":Ljava/lang/String;
    :cond_9
    const/16 v4, 0x50

    goto/16 :goto_1

    .line 197
    :cond_a
    const-string v4, "localhost"

    goto/16 :goto_2

    .line 200
    :cond_b
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    goto/16 :goto_3

    .line 202
    :cond_c
    const-string v4, "/engine.io"

    goto/16 :goto_4

    .line 203
    :cond_d
    const-string v4, "t"

    goto :goto_5

    .line 205
    :cond_e
    new-array v4, v10, [Ljava/lang/String;

    const-string v8, "polling"

    aput-object v8, v4, v6

    const-string v6, "websocket"

    aput-object v6, v4, v5

    goto :goto_6

    .line 207
    :cond_f
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    goto :goto_7

    .line 209
    :cond_10
    const/16 v4, 0x34b

    goto :goto_8

    .line 211
    :cond_11
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultCallFactory:Lokhttp3/Call$Factory;

    goto :goto_9

    .line 212
    :cond_12
    sget-object v4, Lio/socket/engineio/client/Socket;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    goto :goto_a
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 155
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V

    .line 156
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lio/socket/engineio/client/Socket$Options;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "opts"    # Lio/socket/engineio/client/Socket$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 170
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, v0, p2}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    .line 171
    return-void

    .line 170
    :cond_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 159
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;-><init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V

    .line 160
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)V
    .locals 0
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "opts"    # Lio/socket/engineio/client/Socket$Options;

    .prologue
    .line 174
    if-nez p1, :cond_0

    .end local p2    # "opts":Lio/socket/engineio/client/Socket$Options;
    :goto_0
    invoke-direct {p0, p2}, Lio/socket/engineio/client/Socket;-><init>(Lio/socket/engineio/client/Socket$Options;)V

    .line 175
    return-void

    .line 174
    .restart local p2    # "opts":Lio/socket/engineio/client/Socket$Options;
    :cond_0
    invoke-static {p1, p2}, Lio/socket/engineio/client/Socket$Options;->access$100(Ljava/net/URI;Lio/socket/engineio/client/Socket$Options;)Lio/socket/engineio/client/Socket$Options;

    move-result-object p2

    goto :goto_0
.end method

.method static synthetic access$000(Lio/socket/engineio/client/Socket;J)V
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # J

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;->onHeartbeat(J)V

    return-void
.end method

.method static synthetic access$1000(Lio/socket/engineio/client/Socket;Lio/socket/engineio/parser/Packet;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/parser/Packet;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onPacket(Lio/socket/engineio/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1100(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onDrain()V

    return-void
.end method

.method static synthetic access$1200()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$1300(Lio/socket/engineio/client/Socket;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return v0
.end method

.method static synthetic access$1302(Lio/socket/engineio/client/Socket;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Z

    .prologue
    .line 36
    iput-boolean p1, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    return p1
.end method

.method static synthetic access$1400(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    return-void
.end method

.method static synthetic access$1500(Lio/socket/engineio/client/Socket;)J
    .locals 2
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    iget-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    return-wide v0
.end method

.method static synthetic access$1600(Lio/socket/engineio/client/Socket;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->ping()V

    return-void
.end method

.method static synthetic access$1700(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Runnable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1800(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/Runnable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1900(Lio/socket/engineio/client/Socket;Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [B
    .param p3, "x3"    # Ljava/lang/Runnable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$200(Lio/socket/engineio/client/Socket;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->rememberUpgrade:Z

    return v0
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 36
    sget-boolean v0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 36
    sput-boolean p0, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    return p0
.end method

.method static synthetic access$400(Lio/socket/engineio/client/Socket;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lio/socket/engineio/client/Socket;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;

    .prologue
    .line 36
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object v0
.end method

.method static synthetic access$502(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket$ReadyState;)Lio/socket/engineio/client/Socket$ReadyState;
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/client/Socket$ReadyState;

    .prologue
    .line 36
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    return-object p1
.end method

.method static synthetic access$600(Lio/socket/engineio/client/Socket;Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 1
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Transport;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Lio/socket/engineio/client/Transport;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->setTransport(Lio/socket/engineio/client/Transport;)V

    return-void
.end method

.method static synthetic access$800(Lio/socket/engineio/client/Socket;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lio/socket/engineio/client/Socket;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/engineio/client/Socket;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method private createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;
    .locals 9
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 270
    sget-object v4, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 271
    sget-object v4, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v5, "creating transport \'%s\'"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 273
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    iget-object v4, p0, Lio/socket/engineio/client/Socket;->query:Ljava/util/Map;

    invoke-direct {v2, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 275
    .local v2, "query":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "EIO"

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    const-string v4, "transport"

    invoke-interface {v2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 278
    const-string v4, "sid"

    iget-object v5, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    :cond_1
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->transportOptions:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/engineio/client/Transport$Options;

    .line 284
    .local v0, "options":Lio/socket/engineio/client/Transport$Options;
    new-instance v1, Lio/socket/engineio/client/Transport$Options;

    invoke-direct {v1}, Lio/socket/engineio/client/Transport$Options;-><init>()V

    .line 285
    .local v1, "opts":Lio/socket/engineio/client/Transport$Options;
    iput-object v2, v1, Lio/socket/engineio/client/Transport$Options;->query:Ljava/util/Map;

    .line 286
    iput-object p0, v1, Lio/socket/engineio/client/Transport$Options;->socket:Lio/socket/engineio/client/Socket;

    .line 288
    if-eqz v0, :cond_2

    iget-object v4, v0, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    :goto_0
    iput-object v4, v1, Lio/socket/engineio/client/Transport$Options;->hostname:Ljava/lang/String;

    .line 289
    if-eqz v0, :cond_3

    iget v4, v0, Lio/socket/engineio/client/Transport$Options;->port:I

    :goto_1
    iput v4, v1, Lio/socket/engineio/client/Transport$Options;->port:I

    .line 290
    if-eqz v0, :cond_4

    iget-boolean v4, v0, Lio/socket/engineio/client/Transport$Options;->secure:Z

    :goto_2
    iput-boolean v4, v1, Lio/socket/engineio/client/Transport$Options;->secure:Z

    .line 291
    if-eqz v0, :cond_5

    iget-object v4, v0, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    :goto_3
    iput-object v4, v1, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    .line 292
    if-eqz v0, :cond_6

    iget-boolean v4, v0, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    :goto_4
    iput-boolean v4, v1, Lio/socket/engineio/client/Transport$Options;->timestampRequests:Z

    .line 293
    if-eqz v0, :cond_7

    iget-object v4, v0, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    :goto_5
    iput-object v4, v1, Lio/socket/engineio/client/Transport$Options;->timestampParam:Ljava/lang/String;

    .line 294
    if-eqz v0, :cond_8

    iget v4, v0, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    :goto_6
    iput v4, v1, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    .line 295
    if-eqz v0, :cond_9

    iget-object v4, v0, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    :goto_7
    iput-object v4, v1, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    .line 296
    if-eqz v0, :cond_a

    iget-object v4, v0, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    :goto_8
    iput-object v4, v1, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 299
    const-string v4, "websocket"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 300
    new-instance v3, Lio/socket/engineio/client/transports/WebSocket;

    invoke-direct {v3, v1}, Lio/socket/engineio/client/transports/WebSocket;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .line 307
    .local v3, "transport":Lio/socket/engineio/client/Transport;
    :goto_9
    const-string v4, "transport"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v3, v5, v7

    invoke-virtual {p0, v4, v5}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 309
    return-object v3

    .line 288
    .end local v3    # "transport":Lio/socket/engineio/client/Transport;
    :cond_2
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->hostname:Ljava/lang/String;

    goto :goto_0

    .line 289
    :cond_3
    iget v4, p0, Lio/socket/engineio/client/Socket;->port:I

    goto :goto_1

    .line 290
    :cond_4
    iget-boolean v4, p0, Lio/socket/engineio/client/Socket;->secure:Z

    goto :goto_2

    .line 291
    :cond_5
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->path:Ljava/lang/String;

    goto :goto_3

    .line 292
    :cond_6
    iget-boolean v4, p0, Lio/socket/engineio/client/Socket;->timestampRequests:Z

    goto :goto_4

    .line 293
    :cond_7
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->timestampParam:Ljava/lang/String;

    goto :goto_5

    .line 294
    :cond_8
    iget v4, p0, Lio/socket/engineio/client/Socket;->policyPort:I

    goto :goto_6

    .line 295
    :cond_9
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->callFactory:Lokhttp3/Call$Factory;

    goto :goto_7

    .line 296
    :cond_a
    iget-object v4, p0, Lio/socket/engineio/client/Socket;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    goto :goto_8

    .line 301
    :cond_b
    const-string v4, "polling"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 302
    new-instance v3, Lio/socket/engineio/client/transports/PollingXHR;

    invoke-direct {v3, v1}, Lio/socket/engineio/client/transports/PollingXHR;-><init>(Lio/socket/engineio/client/Transport$Options;)V

    .restart local v3    # "transport":Lio/socket/engineio/client/Transport;
    goto :goto_9

    .line 304
    .end local v3    # "transport":Lio/socket/engineio/client/Transport;
    :cond_c
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4}, Ljava/lang/RuntimeException;-><init>()V

    throw v4
.end method

.method private flush()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 655
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-boolean v0, v0, Lio/socket/engineio/client/Transport;->writable:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/socket/engineio/client/Socket;->upgrading:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    .line 656
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 657
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 658
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v1, "flushing %d packets in socket"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 660
    :cond_0
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iput v0, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 661
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    new-array v2, v2, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/socket/engineio/parser/Packet;

    invoke-virtual {v1, v0}, Lio/socket/engineio/client/Transport;->send([Lio/socket/engineio/parser/Packet;)V

    .line 662
    const-string v0, "flush"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 664
    :cond_1
    return-void
.end method

.method private getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 889
    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 891
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private onClose(Ljava/lang/String;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 825
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 826
    return-void
.end method

.method private onClose(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 6
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/Exception;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 829
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v1, v2, :cond_0

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v1, v2, :cond_0

    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v1, v2, :cond_5

    .line 830
    :cond_0
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 831
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v2, "socket close with reason: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 833
    :cond_1
    move-object v0, p0

    .line 836
    .local v0, "self":Lio/socket/engineio/client/Socket;
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_2

    .line 837
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    invoke-interface {v1, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 839
    :cond_2
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_3

    .line 840
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    invoke-interface {v1, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 842
    :cond_3
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_4

    .line 843
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->heartbeatScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 847
    :cond_4
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    const-string v2, "close"

    invoke-virtual {v1, v2}, Lio/socket/engineio/client/Transport;->off(Ljava/lang/String;)Lio/socket/emitter/Emitter;

    .line 850
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v1}, Lio/socket/engineio/client/Transport;->close()Lio/socket/engineio/client/Transport;

    .line 853
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v1}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 856
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    .line 859
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    .line 862
    const-string v1, "close"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v4

    aput-object p2, v2, v5

    invoke-virtual {p0, v1, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 866
    iget-object v1, v0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 867
    iput v4, v0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 869
    .end local v0    # "self":Lio/socket/engineio/client/Socket;
    :cond_5
    return-void
.end method

.method private onDrain()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 642
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    if-ge v0, v1, :cond_0

    .line 643
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 642
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 646
    :cond_0
    iput v2, p0, Lio/socket/engineio/client/Socket;->prevBufferLen:I

    .line 647
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 648
    const-string v1, "drain"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 652
    :goto_1
    return-void

    .line 650
    :cond_1
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    goto :goto_1
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "err"    # Ljava/lang/Exception;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 816
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 817
    sget-object v0, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v1, "socket error %s"

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 819
    :cond_0
    sput-boolean v3, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 820
    const-string v0, "error"

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p1, v1, v3

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 821
    const-string v0, "transport error"

    invoke-direct {p0, v0, p1}, Lio/socket/engineio/client/Socket;->onClose(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 822
    return-void
.end method

.method private onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    .locals 3
    .param p1, "data"    # Lio/socket/engineio/client/HandshakeData;

    .prologue
    .line 562
    const-string v0, "handshake"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 563
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    .line 564
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v0, v0, Lio/socket/engineio/client/Transport;->query:Ljava/util/Map;

    const-string v1, "sid"

    iget-object v2, p1, Lio/socket/engineio/client/HandshakeData;->sid:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    iget-object v0, p1, Lio/socket/engineio/client/HandshakeData;->upgrades:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/socket/engineio/client/Socket;->filterUpgrades(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/socket/engineio/client/Socket;->upgrades:Ljava/util/List;

    .line 566
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingInterval:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    .line 567
    iget-wide v0, p1, Lio/socket/engineio/client/HandshakeData;->pingTimeout:J

    iput-wide v0, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    .line 568
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->onOpen()V

    .line 570
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_0

    .line 575
    :goto_0
    return-void

    .line 571
    :cond_0
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->setPing()V

    .line 573
    const-string v0, "heartbeat"

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->off(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 574
    const-string v0, "heartbeat"

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->onHeartbeatAsListener:Lio/socket/emitter/Emitter$Listener;

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    goto :goto_0
.end method

.method private onHeartbeat(J)V
    .locals 7
    .param p1, "timeout"    # J

    .prologue
    .line 578
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 579
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 582
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-gtz v1, :cond_1

    .line 583
    iget-wide v2, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    iget-wide v4, p0, Lio/socket/engineio/client/Socket;->pingTimeout:J

    add-long p1, v2, v4

    .line 586
    :cond_1
    move-object v0, p0

    .line 587
    .local v0, "self":Lio/socket/engineio/client/Socket;
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    new-instance v2, Lio/socket/engineio/client/Socket$14;

    invoke-direct {v2, p0, v0}, Lio/socket/engineio/client/Socket$14;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, p1, p2, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->pingTimeoutTimer:Ljava/util/concurrent/Future;

    .line 599
    return-void
.end method

.method private onOpen()V
    .locals 3

    .prologue
    .line 512
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v2, "socket open"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 513
    sget-object v1, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    .line 514
    const-string v1, "websocket"

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v2, v2, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 515
    const-string v1, "open"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 516
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    .line 518
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v2, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lio/socket/engineio/client/Socket;->upgrade:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    instance-of v1, v1, Lio/socket/engineio/client/transports/Polling;

    if-eqz v1, :cond_0

    .line 519
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v2, "starting upgrade probes"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 520
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->upgrades:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 521
    .local v0, "upgrade":Ljava/lang/String;
    invoke-direct {p0, v0}, Lio/socket/engineio/client/Socket;->probe(Ljava/lang/String;)V

    goto :goto_0

    .line 524
    .end local v0    # "upgrade":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private onPacket(Lio/socket/engineio/parser/Packet;)V
    .locals 8
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 527
    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v3, Lio/socket/engineio/client/Socket$ReadyState;->OPENING:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v3, Lio/socket/engineio/client/Socket$ReadyState;->OPEN:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    sget-object v3, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v2, v3, :cond_6

    .line 530
    :cond_0
    sget-object v2, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 531
    sget-object v2, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v3, "socket received: type \'%s\', data \'%s\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    aput-object v5, v4, v6

    iget-object v5, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 534
    :cond_1
    const-string v2, "packet"

    new-array v3, v7, [Ljava/lang/Object;

    aput-object p1, v3, v6

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 535
    const-string v2, "heartbeat"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 537
    const-string v2, "open"

    iget-object v3, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 539
    :try_start_0
    new-instance v3, Lio/socket/engineio/client/HandshakeData;

    iget-object v2, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v3, v2}, Lio/socket/engineio/client/HandshakeData;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lio/socket/engineio/client/Socket;->onHandshake(Lio/socket/engineio/client/HandshakeData;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 559
    :cond_2
    :goto_0
    return-void

    .line 540
    :catch_0
    move-exception v0

    .line 541
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "error"

    new-array v3, v7, [Ljava/lang/Object;

    new-instance v4, Lio/socket/engineio/client/EngineIOException;

    invoke-direct {v4, v0}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/Throwable;)V

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 543
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_3
    const-string v2, "pong"

    iget-object v3, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 544
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->setPing()V

    .line 545
    const-string v2, "pong"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 546
    :cond_4
    const-string v2, "error"

    iget-object v3, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 547
    new-instance v1, Lio/socket/engineio/client/EngineIOException;

    const-string v2, "server error"

    invoke-direct {v1, v2}, Lio/socket/engineio/client/EngineIOException;-><init>(Ljava/lang/String;)V

    .line 548
    .local v1, "err":Lio/socket/engineio/client/EngineIOException;
    iget-object v2, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    iput-object v2, v1, Lio/socket/engineio/client/EngineIOException;->code:Ljava/lang/Object;

    .line 549
    invoke-direct {p0, v1}, Lio/socket/engineio/client/Socket;->onError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 550
    .end local v1    # "err":Lio/socket/engineio/client/EngineIOException;
    :cond_5
    const-string v2, "message"

    iget-object v3, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 551
    const-string v2, "data"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 552
    const-string v2, "message"

    new-array v3, v7, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/parser/Packet;->data:Ljava/lang/Object;

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 555
    :cond_6
    sget-object v2, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 556
    sget-object v2, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v3, "packet received with socket readyState \'%s\'"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private ping()V
    .locals 1

    .prologue
    .line 628
    new-instance v0, Lio/socket/engineio/client/Socket$16;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$16;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 639
    return-void
.end method

.method private probe(Ljava/lang/String;)V
    .locals 22
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 351
    sget-object v3, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v5}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 352
    sget-object v3, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v5, "probing transport \'%s\'"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 354
    :cond_0
    const/4 v3, 0x1

    new-array v6, v3, [Lio/socket/engineio/client/Transport;

    const/4 v3, 0x0

    invoke-direct/range {p0 .. p1}, Lio/socket/engineio/client/Socket;->createTransport(Ljava/lang/String;)Lio/socket/engineio/client/Transport;

    move-result-object v5

    aput-object v5, v6, v3

    .line 355
    .local v6, "transport":[Lio/socket/engineio/client/Transport;
    const/4 v3, 0x1

    new-array v4, v3, [Z

    const/4 v3, 0x0

    const/4 v5, 0x0

    aput-boolean v5, v4, v3

    .line 356
    .local v4, "failed":[Z
    move-object/from16 v7, p0

    .line 358
    .local v7, "self":Lio/socket/engineio/client/Socket;
    const/4 v3, 0x0

    sput-boolean v3, Lio/socket/engineio/client/Socket;->priorWebsocketSuccess:Z

    .line 360
    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/Runnable;

    .line 362
    .local v8, "cleanup":[Ljava/lang/Runnable;
    new-instance v2, Lio/socket/engineio/client/Socket$7;

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    invoke-direct/range {v2 .. v8}, Lio/socket/engineio/client/Socket$7;-><init>(Lio/socket/engineio/client/Socket;[ZLjava/lang/String;[Lio/socket/engineio/client/Transport;Lio/socket/engineio/client/Socket;[Ljava/lang/Runnable;)V

    .line 422
    .local v2, "onTransportOpen":Lio/socket/emitter/Emitter$Listener;
    new-instance v12, Lio/socket/engineio/client/Socket$8;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v4, v8, v6}, Lio/socket/engineio/client/Socket$8;-><init>(Lio/socket/engineio/client/Socket;[Z[Ljava/lang/Runnable;[Lio/socket/engineio/client/Transport;)V

    .line 437
    .local v12, "freezeTransport":Lio/socket/emitter/Emitter$Listener;
    new-instance v9, Lio/socket/engineio/client/Socket$9;

    move-object/from16 v10, p0

    move-object v11, v6

    move-object/from16 v13, p1

    move-object v14, v7

    invoke-direct/range {v9 .. v14}, Lio/socket/engineio/client/Socket$9;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Ljava/lang/String;Lio/socket/engineio/client/Socket;)V

    .line 461
    .local v9, "onerror":Lio/socket/emitter/Emitter$Listener;
    new-instance v18, Lio/socket/engineio/client/Socket$10;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9}, Lio/socket/engineio/client/Socket$10;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 469
    .local v18, "onTransportClose":Lio/socket/emitter/Emitter$Listener;
    new-instance v20, Lio/socket/engineio/client/Socket$11;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9}, Lio/socket/engineio/client/Socket$11;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;)V

    .line 477
    .local v20, "onclose":Lio/socket/emitter/Emitter$Listener;
    new-instance v21, Lio/socket/engineio/client/Socket$12;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6, v12}, Lio/socket/engineio/client/Socket$12;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;)V

    .line 490
    .local v21, "onupgrade":Lio/socket/emitter/Emitter$Listener;
    const/4 v3, 0x0

    new-instance v13, Lio/socket/engineio/client/Socket$13;

    move-object/from16 v14, p0

    move-object v15, v6

    move-object/from16 v16, v2

    move-object/from16 v17, v9

    move-object/from16 v19, v7

    invoke-direct/range {v13 .. v21}, Lio/socket/engineio/client/Socket$13;-><init>(Lio/socket/engineio/client/Socket;[Lio/socket/engineio/client/Transport;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;Lio/socket/engineio/client/Socket;Lio/socket/emitter/Emitter$Listener;Lio/socket/emitter/Emitter$Listener;)V

    aput-object v13, v8, v3

    .line 501
    const/4 v3, 0x0

    aget-object v3, v6, v3

    const-string v5, "open"

    invoke-virtual {v3, v5, v2}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 502
    const/4 v3, 0x0

    aget-object v3, v6, v3

    const-string v5, "error"

    invoke-virtual {v3, v5, v9}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 503
    const/4 v3, 0x0

    aget-object v3, v6, v3

    const-string v5, "close"

    move-object/from16 v0, v18

    invoke-virtual {v3, v5, v0}, Lio/socket/engineio/client/Transport;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 505
    const-string v3, "close"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 506
    const-string v3, "upgrading"

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v3, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 508
    const/4 v3, 0x0

    aget-object v3, v6, v3

    invoke-virtual {v3}, Lio/socket/engineio/client/Transport;->open()Lio/socket/engineio/client/Transport;

    .line 509
    return-void
.end method

.method private sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 734
    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSING:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-eq v0, v1, :cond_0

    sget-object v0, Lio/socket/engineio/client/Socket$ReadyState;->CLOSED:Lio/socket/engineio/client/Socket$ReadyState;

    iget-object v1, p0, Lio/socket/engineio/client/Socket;->readyState:Lio/socket/engineio/client/Socket$ReadyState;

    if-ne v0, v1, :cond_1

    .line 749
    :cond_0
    :goto_0
    return-void

    .line 738
    :cond_1
    const-string v0, "packetCreate"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 739
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->writeBuffer:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 740
    if-eqz p2, :cond_2

    .line 741
    const-string v0, "flush"

    new-instance v1, Lio/socket/engineio/client/Socket$19;

    invoke-direct {v1, p0, p2}, Lio/socket/engineio/client/Socket$19;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0, v1}, Lio/socket/engineio/client/Socket;->once(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 748
    :cond_2
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->flush()V

    goto :goto_0
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 720
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 721
    return-void
.end method

.method private sendPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 724
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 725
    .local v0, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<Ljava/lang/String;>;"
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 726
    return-void
.end method

.method private sendPacket(Ljava/lang/String;[BLjava/lang/Runnable;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 729
    new-instance v0, Lio/socket/engineio/parser/Packet;

    invoke-direct {v0, p1, p2}, Lio/socket/engineio/parser/Packet;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 730
    .local v0, "packet":Lio/socket/engineio/parser/Packet;, "Lio/socket/engineio/parser/Packet<[B>;"
    invoke-direct {p0, v0, p3}, Lio/socket/engineio/client/Socket;->sendPacket(Lio/socket/engineio/parser/Packet;Ljava/lang/Runnable;)V

    .line 731
    return-void
.end method

.method public static setDefaultOkHttpCallFactory(Lokhttp3/Call$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/Call$Factory;

    .prologue
    .line 232
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultCallFactory:Lokhttp3/Call$Factory;

    .line 233
    return-void
.end method

.method public static setDefaultOkHttpWebSocketFactory(Lokhttp3/WebSocket$Factory;)V
    .locals 0
    .param p0, "factory"    # Lokhttp3/WebSocket$Factory;

    .prologue
    .line 228
    sput-object p0, Lio/socket/engineio/client/Socket;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 229
    return-void
.end method

.method private setPing()V
    .locals 6

    .prologue
    .line 602
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 603
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 606
    :cond_0
    move-object v0, p0

    .line 607
    .local v0, "self":Lio/socket/engineio/client/Socket;
    invoke-direct {p0}, Lio/socket/engineio/client/Socket;->getHeartbeatScheduler()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    new-instance v2, Lio/socket/engineio/client/Socket$15;

    invoke-direct {v2, p0, v0}, Lio/socket/engineio/client/Socket$15;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    iget-wide v4, p0, Lio/socket/engineio/client/Socket;->pingInterval:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v4, v5, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Lio/socket/engineio/client/Socket;->pingIntervalTimer:Ljava/util/concurrent/Future;

    .line 622
    return-void
.end method

.method private setTransport(Lio/socket/engineio/client/Transport;)V
    .locals 7
    .param p1, "transport"    # Lio/socket/engineio/client/Transport;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 313
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 314
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v2, "setting transport %s"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p1, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 316
    :cond_0
    move-object v0, p0

    .line 318
    .local v0, "self":Lio/socket/engineio/client/Socket;
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    if-eqz v1, :cond_2

    .line 319
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 320
    sget-object v1, Lio/socket/engineio/client/Socket;->logger:Ljava/util/logging/Logger;

    const-string v2, "clearing existing transport %s"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    iget-object v4, v4, Lio/socket/engineio/client/Transport;->name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 322
    :cond_1
    iget-object v1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    invoke-virtual {v1}, Lio/socket/engineio/client/Transport;->off()Lio/socket/emitter/Emitter;

    .line 325
    :cond_2
    iput-object p1, p0, Lio/socket/engineio/client/Socket;->transport:Lio/socket/engineio/client/Transport;

    .line 327
    const-string v1, "drain"

    new-instance v2, Lio/socket/engineio/client/Socket$6;

    invoke-direct {v2, p0, v0}, Lio/socket/engineio/client/Socket$6;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    invoke-virtual {p1, v1, v2}, Lio/socket/engineio/client/Transport;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v1

    const-string v2, "packet"

    new-instance v3, Lio/socket/engineio/client/Socket$5;

    invoke-direct {v3, p0, v0}, Lio/socket/engineio/client/Socket$5;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 332
    invoke-virtual {v1, v2, v3}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v1

    const-string v2, "error"

    new-instance v3, Lio/socket/engineio/client/Socket$4;

    invoke-direct {v3, p0, v0}, Lio/socket/engineio/client/Socket$4;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 337
    invoke-virtual {v1, v2, v3}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    move-result-object v1

    const-string v2, "close"

    new-instance v3, Lio/socket/engineio/client/Socket$3;

    invoke-direct {v3, p0, v0}, Lio/socket/engineio/client/Socket$3;-><init>(Lio/socket/engineio/client/Socket;Lio/socket/engineio/client/Socket;)V

    .line 342
    invoke-virtual {v1, v2, v3}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 348
    return-void
.end method


# virtual methods
.method public close()Lio/socket/engineio/client/Socket;
    .locals 1

    .prologue
    .line 757
    new-instance v0, Lio/socket/engineio/client/Socket$20;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$20;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 812
    return-object p0
.end method

.method filterUpgrades(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 872
    .local p1, "upgrades":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 873
    .local v0, "filteredUpgrades":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 874
    .local v1, "upgrade":Ljava/lang/String;
    iget-object v3, p0, Lio/socket/engineio/client/Socket;->transports:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 875
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 880
    .end local v1    # "upgrade":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 884
    iget-object v0, p0, Lio/socket/engineio/client/Socket;->id:Ljava/lang/String;

    return-object v0
.end method

.method public open()Lio/socket/engineio/client/Socket;
    .locals 1

    .prologue
    .line 241
    new-instance v0, Lio/socket/engineio/client/Socket$2;

    invoke-direct {v0, p0}, Lio/socket/engineio/client/Socket$2;-><init>(Lio/socket/engineio/client/Socket;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 266
    return-object p0
.end method

.method public send(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 688
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 689
    return-void
.end method

.method public send(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 702
    new-instance v0, Lio/socket/engineio/client/Socket$17;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$17;-><init>(Lio/socket/engineio/client/Socket;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 708
    return-void
.end method

.method public send([B)V
    .locals 1
    .param p1, "msg"    # [B

    .prologue
    .line 692
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    .line 693
    return-void
.end method

.method public send([BLjava/lang/Runnable;)V
    .locals 1
    .param p1, "msg"    # [B
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 711
    new-instance v0, Lio/socket/engineio/client/Socket$18;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/engineio/client/Socket$18;-><init>(Lio/socket/engineio/client/Socket;[BLjava/lang/Runnable;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 717
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 667
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 668
    return-void
.end method

.method public write(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 671
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 672
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "msg"    # [B

    .prologue
    .line 675
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/engineio/client/Socket;->write([BLjava/lang/Runnable;)V

    .line 676
    return-void
.end method

.method public write([BLjava/lang/Runnable;)V
    .locals 0
    .param p1, "msg"    # [B
    .param p2, "fn"    # Ljava/lang/Runnable;

    .prologue
    .line 679
    invoke-virtual {p0, p1, p2}, Lio/socket/engineio/client/Socket;->send([BLjava/lang/Runnable;)V

    .line 680
    return-void
.end method
