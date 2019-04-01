.class public Lio/socket/client/Manager;
.super Lio/socket/emitter/Emitter;
.source "Manager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/Manager$Options;,
        Lio/socket/client/Manager$Engine;,
        Lio/socket/client/Manager$OpenCallback;,
        Lio/socket/client/Manager$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_CONNECT_ERROR:Ljava/lang/String; = "connect_error"

.field public static final EVENT_CONNECT_TIMEOUT:Ljava/lang/String; = "connect_timeout"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_RECONNECT:Ljava/lang/String; = "reconnect"

.field public static final EVENT_RECONNECTING:Ljava/lang/String; = "reconnecting"

.field public static final EVENT_RECONNECT_ATTEMPT:Ljava/lang/String; = "reconnect_attempt"

.field public static final EVENT_RECONNECT_ERROR:Ljava/lang/String; = "reconnect_error"

.field public static final EVENT_RECONNECT_FAILED:Ljava/lang/String; = "reconnect_failed"

.field public static final EVENT_TRANSPORT:Ljava/lang/String; = "transport"

.field static defaultCallFactory:Lokhttp3/Call$Factory;

.field static defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private _randomizationFactor:D

.field private _reconnection:Z

.field private _reconnectionAttempts:I

.field private _reconnectionDelay:J

.field private _reconnectionDelayMax:J

.field private _timeout:J

.field private backoff:Lio/socket/backo/Backoff;

.field private connecting:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private decoder:Lio/socket/parser/Parser$Decoder;

.field private encoder:Lio/socket/parser/Parser$Encoder;

.field private encoding:Z

.field engine:Lio/socket/engineio/client/Socket;

.field private lastPing:Ljava/util/Date;

.field nsps:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private opts:Lio/socket/client/Manager$Options;

.field private packetBuffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/socket/parser/Packet;",
            ">;"
        }
    .end annotation
.end field

.field readyState:Lio/socket/client/Manager$ReadyState;

.field private reconnecting:Z

.field private skipReconnect:Z

.field private subs:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lio/socket/client/On$Handle;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Ljava/net/URI;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lio/socket/client/Manager;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 118
    invoke-direct {p0, v0, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Lio/socket/client/Manager$Options;)V
    .locals 1
    .param p1, "opts"    # Lio/socket/client/Manager$Options;

    .prologue
    .line 126
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 122
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    .line 123
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V
    .locals 4
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "opts"    # Lio/socket/client/Manager$Options;

    .prologue
    const-wide/16 v2, 0x0

    .line 129
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 101
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    .line 130
    if-nez p2, :cond_0

    .line 131
    new-instance p2, Lio/socket/client/Manager$Options;

    .end local p2    # "opts":Lio/socket/client/Manager$Options;
    invoke-direct {p2}, Lio/socket/client/Manager$Options;-><init>()V

    .line 133
    .restart local p2    # "opts":Lio/socket/client/Manager$Options;
    :cond_0
    iget-object v0, p2, Lio/socket/client/Manager$Options;->path:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 134
    const-string v0, "/socket.io"

    iput-object v0, p2, Lio/socket/client/Manager$Options;->path:Ljava/lang/String;

    .line 136
    :cond_1
    iget-object v0, p2, Lio/socket/client/Manager$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-nez v0, :cond_2

    .line 137
    sget-object v0, Lio/socket/client/Manager;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    iput-object v0, p2, Lio/socket/client/Manager$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    .line 139
    :cond_2
    iget-object v0, p2, Lio/socket/client/Manager$Options;->callFactory:Lokhttp3/Call$Factory;

    if-nez v0, :cond_3

    .line 140
    sget-object v0, Lio/socket/client/Manager;->defaultCallFactory:Lokhttp3/Call$Factory;

    iput-object v0, p2, Lio/socket/client/Manager$Options;->callFactory:Lokhttp3/Call$Factory;

    .line 142
    :cond_3
    iput-object p2, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    .line 143
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    .line 144
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    .line 145
    iget-boolean v0, p2, Lio/socket/client/Manager$Options;->reconnection:Z

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnection(Z)Lio/socket/client/Manager;

    .line 146
    iget v0, p2, Lio/socket/client/Manager$Options;->reconnectionAttempts:I

    if-eqz v0, :cond_4

    iget v0, p2, Lio/socket/client/Manager$Options;->reconnectionAttempts:I

    :goto_0
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnectionAttempts(I)Lio/socket/client/Manager;

    .line 147
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_5

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    :goto_1
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelay(J)Lio/socket/client/Manager;

    .line 148
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    :goto_2
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelayMax(J)Lio/socket/client/Manager;

    .line 149
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->randomizationFactor:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_7

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->randomizationFactor:D

    :goto_3
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->randomizationFactor(D)Lio/socket/client/Manager;

    .line 150
    new-instance v0, Lio/socket/backo/Backoff;

    invoke-direct {v0}, Lio/socket/backo/Backoff;-><init>()V

    .line 151
    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelay()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    move-result-object v0

    .line 152
    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelayMax()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    move-result-object v0

    .line 153
    invoke-virtual {p0}, Lio/socket/client/Manager;->randomizationFactor()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    move-result-object v0

    iput-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    .line 154
    iget-wide v0, p2, Lio/socket/client/Manager$Options;->timeout:J

    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->timeout(J)Lio/socket/client/Manager;

    .line 155
    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 156
    iput-object p1, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    .line 157
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    .line 159
    iget-object v0, p2, Lio/socket/client/Manager$Options;->encoder:Lio/socket/parser/Parser$Encoder;

    if-eqz v0, :cond_8

    iget-object v0, p2, Lio/socket/client/Manager$Options;->encoder:Lio/socket/parser/Parser$Encoder;

    :goto_4
    iput-object v0, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    .line 160
    iget-object v0, p2, Lio/socket/client/Manager$Options;->decoder:Lio/socket/parser/Parser$Decoder;

    if-eqz v0, :cond_9

    iget-object v0, p2, Lio/socket/client/Manager$Options;->decoder:Lio/socket/parser/Parser$Decoder;

    :goto_5
    iput-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    .line 161
    return-void

    .line 146
    :cond_4
    const v0, 0x7fffffff

    goto :goto_0

    .line 147
    :cond_5
    const-wide/16 v0, 0x3e8

    goto :goto_1

    .line 148
    :cond_6
    const-wide/16 v0, 0x1388

    goto :goto_2

    .line 149
    :cond_7
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    goto :goto_3

    .line 159
    :cond_8
    new-instance v0, Lio/socket/parser/IOParser$Encoder;

    invoke-direct {v0}, Lio/socket/parser/IOParser$Encoder;-><init>()V

    goto :goto_4

    .line 160
    :cond_9
    new-instance v0, Lio/socket/parser/IOParser$Decoder;

    invoke-direct {v0}, Lio/socket/parser/IOParser$Decoder;-><init>()V

    goto :goto_5
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$100(Lio/socket/client/Manager;)Ljava/net/URI;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-object v0, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    return-object v0
.end method

.method static synthetic access$1000(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondata(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lio/socket/client/Manager;[B)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # [B

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondata([B)V

    return-void
.end method

.method static synthetic access$1200(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->onping()V

    return-void
.end method

.method static synthetic access$1300(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->onpong()V

    return-void
.end method

.method static synthetic access$1400(Lio/socket/client/Manager;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onerror(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$1500(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onclose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lio/socket/client/Manager;Lio/socket/parser/Packet;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Lio/socket/parser/Packet;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondecoded(Lio/socket/parser/Packet;)V

    return-void
.end method

.method static synthetic access$1700(Lio/socket/client/Manager;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1800(Lio/socket/client/Manager;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lio/socket/client/Manager;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1902(Lio/socket/client/Manager;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lio/socket/client/Manager;->encoding:Z

    return p1
.end method

.method static synthetic access$200(Lio/socket/client/Manager;)Lio/socket/client/Manager$Options;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-object v0, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    return-object v0
.end method

.method static synthetic access$2000(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->processPacketQueue()V

    return-void
.end method

.method static synthetic access$2100(Lio/socket/client/Manager;)Lio/socket/backo/Backoff;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    return-object v0
.end method

.method static synthetic access$2202(Lio/socket/client/Manager;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lio/socket/client/Manager;->reconnecting:Z

    return p1
.end method

.method static synthetic access$2300(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    return-void
.end method

.method static synthetic access$2400(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->onreconnect()V

    return-void
.end method

.method static synthetic access$300(Lio/socket/client/Manager;)Z
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return v0
.end method

.method static synthetic access$302(Lio/socket/client/Manager;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return p1
.end method

.method static synthetic access$400(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->onopen()V

    return-void
.end method

.method static synthetic access$500(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    return-void
.end method

.method static synthetic access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lio/socket/client/Manager;)V
    .locals 0
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    invoke-direct {p0}, Lio/socket/client/Manager;->maybeReconnectOnOpen()V

    return-void
.end method

.method static synthetic access$800(Lio/socket/client/Manager;)J
    .locals 2
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method static synthetic access$900(Lio/socket/client/Manager;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lio/socket/client/Manager;

    .prologue
    .line 30
    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    return-object v0
.end method

.method private cleanup()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 519
    sget-object v1, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v2, "cleanup"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 522
    :goto_0
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/On$Handle;

    .local v0, "sub":Lio/socket/client/On$Handle;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/socket/client/On$Handle;->destroy()V

    goto :goto_0

    .line 523
    :cond_0
    iget-object v1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-interface {v1, v3}, Lio/socket/parser/Parser$Decoder;->onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V

    .line 525
    iget-object v1, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 526
    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/socket/client/Manager;->encoding:Z

    .line 527
    iput-object v3, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    .line 529
    iget-object v1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-interface {v1}, Lio/socket/parser/Parser$Decoder;->destroy()V

    .line 530
    return-void
.end method

.method private varargs emitAll(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 164
    invoke-virtual {p0, p1, p2}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 165
    iget-object v1, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/Socket;

    .line 166
    .local v0, "socket":Lio/socket/client/Socket;
    invoke-virtual {v0, p1, p2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 168
    .end local v0    # "socket":Lio/socket/client/Socket;
    :cond_0
    return-void
.end method

.method private generateId(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "nsp"    # Ljava/lang/String;

    .prologue
    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "/"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {v1}, Lio/socket/engineio/client/Socket;->id()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "#"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private maybeReconnectOnOpen()V
    .locals 1

    .prologue
    .line 250
    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    if-nez v0, :cond_0

    .line 251
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    .line 253
    :cond_0
    return-void
.end method

.method private onclose(Ljava/lang/String;)V
    .locals 3
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 549
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "onclose"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 550
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 551
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    .line 552
    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 553
    const-string v0, "close"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 555
    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-nez v0, :cond_0

    .line 556
    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    .line 558
    :cond_0
    return-void
.end method

.method private ondata(Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 419
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-interface {v0, p1}, Lio/socket/parser/Parser$Decoder;->add(Ljava/lang/String;)V

    .line 420
    return-void
.end method

.method private ondata([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 423
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-interface {v0, p1}, Lio/socket/parser/Parser$Decoder;->add([B)V

    .line 424
    return-void
.end method

.method private ondecoded(Lio/socket/parser/Packet;)V
    .locals 3
    .param p1, "packet"    # Lio/socket/parser/Packet;

    .prologue
    .line 427
    const-string v0, "packet"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 428
    return-void
.end method

.method private onerror(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "err"    # Ljava/lang/Exception;

    .prologue
    .line 431
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "error"

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 432
    const-string v0, "error"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 433
    return-void
.end method

.method private onopen()V
    .locals 4

    .prologue
    .line 357
    sget-object v1, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v2, "open"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 359
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 361
    sget-object v1, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    iput-object v1, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 362
    const-string v1, "open"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lio/socket/client/Manager;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 364
    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    .line 365
    .local v0, "socket":Lio/socket/engineio/client/Socket;
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    const-string v2, "data"

    new-instance v3, Lio/socket/client/Manager$2;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$2;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v0, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 376
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    const-string v2, "ping"

    new-instance v3, Lio/socket/client/Manager$3;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$3;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v0, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 382
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    const-string v2, "pong"

    new-instance v3, Lio/socket/client/Manager$4;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$4;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v0, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 388
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    const-string v2, "error"

    new-instance v3, Lio/socket/client/Manager$5;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$5;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v0, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 394
    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    const-string v2, "close"

    new-instance v3, Lio/socket/client/Manager$6;

    invoke-direct {v3, p0}, Lio/socket/client/Manager$6;-><init>(Lio/socket/client/Manager;)V

    invoke-static {v0, v2, v3}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 400
    iget-object v1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    new-instance v2, Lio/socket/client/Manager$7;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$7;-><init>(Lio/socket/client/Manager;)V

    invoke-interface {v1, v2}, Lio/socket/parser/Parser$Decoder;->onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V

    .line 406
    return-void
.end method

.method private onping()V
    .locals 2

    .prologue
    .line 409
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    .line 410
    const-string v0, "ping"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 411
    return-void
.end method

.method private onpong()V
    .locals 8

    .prologue
    .line 414
    const-string v2, "pong"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v0, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 415
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-object v5, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long/2addr v0, v6

    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v3, v4

    .line 414
    invoke-direct {p0, v2, v3}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 416
    return-void

    .line 415
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private onreconnect()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 621
    iget-object v1, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v1}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    .line 622
    .local v0, "attempts":I
    iput-boolean v4, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 623
    iget-object v1, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v1}, Lio/socket/backo/Backoff;->reset()V

    .line 624
    invoke-direct {p0}, Lio/socket/client/Manager;->updateSocketIds()V

    .line 625
    const-string v1, "reconnect"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-direct {p0, v1, v2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 626
    return-void
.end method

.method private processPacketQueue()V
    .locals 3

    .prologue
    .line 512
    iget-object v1, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lio/socket/client/Manager;->encoding:Z

    if-nez v1, :cond_0

    .line 513
    iget-object v1, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/parser/Packet;

    .line 514
    .local v0, "pack":Lio/socket/parser/Packet;
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->packet(Lio/socket/parser/Packet;)V

    .line 516
    .end local v0    # "pack":Lio/socket/parser/Packet;
    :cond_0
    return-void
.end method

.method private reconnect()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 561
    iget-boolean v4, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-eqz v4, :cond_1

    .line 618
    :cond_0
    :goto_0
    return-void

    .line 563
    :cond_1
    move-object v2, p0

    .line 565
    .local v2, "self":Lio/socket/client/Manager;
    iget-object v4, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v4}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v4

    iget v5, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    if-lt v4, v5, :cond_2

    .line 566
    sget-object v4, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v5, "reconnect failed"

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 567
    iget-object v4, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v4}, Lio/socket/backo/Backoff;->reset()V

    .line 568
    const-string v4, "reconnect_failed"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-direct {p0, v4, v5}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 569
    iput-boolean v8, p0, Lio/socket/client/Manager;->reconnecting:Z

    goto :goto_0

    .line 571
    :cond_2
    iget-object v4, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v4}, Lio/socket/backo/Backoff;->duration()J

    move-result-wide v0

    .line 572
    .local v0, "delay":J
    sget-object v4, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v5, "will wait %dms before reconnect attempt"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 574
    iput-boolean v9, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 575
    new-instance v3, Ljava/util/Timer;

    invoke-direct {v3}, Ljava/util/Timer;-><init>()V

    .line 576
    .local v3, "timer":Ljava/util/Timer;
    new-instance v4, Lio/socket/client/Manager$11;

    invoke-direct {v4, p0, v2}, Lio/socket/client/Manager$11;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-virtual {v3, v4, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 611
    iget-object v4, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v5, Lio/socket/client/Manager$12;

    invoke-direct {v5, p0, v3}, Lio/socket/client/Manager$12;-><init>(Lio/socket/client/Manager;Ljava/util/Timer;)V

    invoke-interface {v4, v5}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private updateSocketIds()V
    .locals 5

    .prologue
    .line 174
    iget-object v3, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 175
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/socket/client/Socket;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 176
    .local v1, "nsp":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/socket/client/Socket;

    .line 177
    .local v2, "socket":Lio/socket/client/Socket;
    invoke-direct {p0, v1}, Lio/socket/client/Manager;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lio/socket/client/Socket;->id:Ljava/lang/String;

    goto :goto_0

    .line 179
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/socket/client/Socket;>;"
    .end local v1    # "nsp":Ljava/lang/String;
    .end local v2    # "socket":Lio/socket/client/Socket;
    :cond_0
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .prologue
    .line 533
    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 534
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    .line 535
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    .line 536
    iget-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v1, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    if-eq v0, v1, :cond_0

    .line 539
    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    .line 541
    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    .line 542
    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    .line 543
    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    if-eqz v0, :cond_1

    .line 544
    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->close()Lio/socket/engineio/client/Socket;

    .line 546
    :cond_1
    return-void
.end method

.method destroy(Lio/socket/client/Socket;)V
    .locals 1
    .param p1, "socket"    # Lio/socket/client/Socket;

    .prologue
    .line 474
    iget-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 475
    iget-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 478
    :goto_0
    return-void

    .line 477
    :cond_0
    invoke-virtual {p0}, Lio/socket/client/Manager;->close()V

    goto :goto_0
.end method

.method public open()Lio/socket/client/Manager;
    .locals 1

    .prologue
    .line 256
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;

    move-result-object v0

    return-object v0
.end method

.method public open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;
    .locals 1
    .param p1, "fn"    # Lio/socket/client/Manager$OpenCallback;

    .prologue
    .line 266
    new-instance v0, Lio/socket/client/Manager$1;

    invoke-direct {v0, p0, p1}, Lio/socket/client/Manager$1;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager$OpenCallback;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    .line 353
    return-object p0
.end method

.method packet(Lio/socket/parser/Packet;)V
    .locals 6
    .param p1, "packet"    # Lio/socket/parser/Packet;

    .prologue
    const/4 v5, 0x1

    .line 481
    sget-object v1, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 482
    sget-object v1, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v2, "writing packet %s"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 484
    :cond_0
    move-object v0, p0

    .line 486
    .local v0, "self":Lio/socket/client/Manager;
    iget-object v1, p1, Lio/socket/parser/Packet;->query:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lio/socket/parser/Packet;->query:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget v1, p1, Lio/socket/parser/Packet;->type:I

    if-nez v1, :cond_1

    .line 487
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lio/socket/parser/Packet;->query:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 490
    :cond_1
    iget-boolean v1, v0, Lio/socket/client/Manager;->encoding:Z

    if-nez v1, :cond_2

    .line 491
    iput-boolean v5, v0, Lio/socket/client/Manager;->encoding:Z

    .line 492
    iget-object v1, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    new-instance v2, Lio/socket/client/Manager$10;

    invoke-direct {v2, p0, v0}, Lio/socket/client/Manager$10;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-interface {v1, p1, v2}, Lio/socket/parser/Parser$Encoder;->encode(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V

    .line 509
    :goto_0
    return-void

    .line 507
    :cond_2
    iget-object v1, v0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final randomizationFactor()D
    .locals 2

    .prologue
    .line 216
    iget-wide v0, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    return-wide v0
.end method

.method public randomizationFactor(D)Lio/socket/client/Manager;
    .locals 1
    .param p1, "v"    # D

    .prologue
    .line 220
    iput-wide p1, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    .line 221
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    .line 224
    :cond_0
    return-object p0
.end method

.method public reconnection(Z)Lio/socket/client/Manager;
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Lio/socket/client/Manager;->_reconnection:Z

    .line 191
    return-object p0
.end method

.method public reconnection()Z
    .locals 1

    .prologue
    .line 186
    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    return v0
.end method

.method public reconnectionAttempts()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    return v0
.end method

.method public reconnectionAttempts(I)Lio/socket/client/Manager;
    .locals 0
    .param p1, "v"    # I

    .prologue
    .line 199
    iput p1, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    .line 200
    return-object p0
.end method

.method public final reconnectionDelay()J
    .locals 2

    .prologue
    .line 204
    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    return-wide v0
.end method

.method public reconnectionDelay(J)Lio/socket/client/Manager;
    .locals 1
    .param p1, "v"    # J

    .prologue
    .line 208
    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    .line 209
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    .line 212
    :cond_0
    return-object p0
.end method

.method public final reconnectionDelayMax()J
    .locals 2

    .prologue
    .line 228
    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    return-wide v0
.end method

.method public reconnectionDelayMax(J)Lio/socket/client/Manager;
    .locals 1
    .param p1, "v"    # J

    .prologue
    .line 232
    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    .line 233
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    .line 236
    :cond_0
    return-object p0
.end method

.method public socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 1
    .param p1, "nsp"    # Ljava/lang/String;

    .prologue
    .line 470
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/client/Manager;->socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;

    move-result-object v0

    return-object v0
.end method

.method public socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;
    .locals 6
    .param p1, "nsp"    # Ljava/lang/String;
    .param p2, "opts"    # Lio/socket/client/Manager$Options;

    .prologue
    .line 443
    iget-object v4, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/socket/client/Socket;

    .line 444
    .local v3, "socket":Lio/socket/client/Socket;
    if-nez v3, :cond_0

    .line 445
    new-instance v3, Lio/socket/client/Socket;

    .end local v3    # "socket":Lio/socket/client/Socket;
    invoke-direct {v3, p0, p1, p2}, Lio/socket/client/Socket;-><init>(Lio/socket/client/Manager;Ljava/lang/String;Lio/socket/client/Manager$Options;)V

    .line 446
    .restart local v3    # "socket":Lio/socket/client/Socket;
    iget-object v4, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/Socket;

    .line 447
    .local v0, "_socket":Lio/socket/client/Socket;
    if-eqz v0, :cond_1

    .line 448
    move-object v3, v0

    .line 466
    .end local v0    # "_socket":Lio/socket/client/Socket;
    :cond_0
    :goto_0
    return-object v3

    .line 450
    .restart local v0    # "_socket":Lio/socket/client/Socket;
    :cond_1
    move-object v2, p0

    .line 451
    .local v2, "self":Lio/socket/client/Manager;
    move-object v1, v3

    .line 452
    .local v1, "s":Lio/socket/client/Socket;
    const-string v4, "connecting"

    new-instance v5, Lio/socket/client/Manager$8;

    invoke-direct {v5, p0, v2, v1}, Lio/socket/client/Manager$8;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;Lio/socket/client/Socket;)V

    invoke-virtual {v3, v4, v5}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 458
    const-string v4, "connect"

    new-instance v5, Lio/socket/client/Manager$9;

    invoke-direct {v5, p0, v1, v2, p1}, Lio/socket/client/Manager$9;-><init>(Lio/socket/client/Manager;Lio/socket/client/Socket;Lio/socket/client/Manager;Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    goto :goto_0
.end method

.method public timeout()J
    .locals 2

    .prologue
    .line 240
    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method public timeout(J)Lio/socket/client/Manager;
    .locals 1
    .param p1, "v"    # J

    .prologue
    .line 244
    iput-wide p1, p0, Lio/socket/client/Manager;->_timeout:J

    .line 245
    return-object p0
.end method
