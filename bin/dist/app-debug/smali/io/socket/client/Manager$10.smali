.class Lio/socket/client/Manager$10;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/parser/Parser$Encoder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->packet(Lio/socket/parser/Packet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Manager;

    .prologue
    .line 492
    iput-object p1, p0, Lio/socket/client/Manager$10;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$10;->val$self:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call([Ljava/lang/Object;)V
    .locals 5
    .param p1, "encodedPackets"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 495
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v0, p1, v1

    .line 496
    .local v0, "packet":Ljava/lang/Object;
    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 497
    iget-object v4, p0, Lio/socket/client/Manager$10;->val$self:Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    check-cast v0, Ljava/lang/String;

    .end local v0    # "packet":Ljava/lang/Object;
    invoke-virtual {v4, v0}, Lio/socket/engineio/client/Socket;->write(Ljava/lang/String;)V

    .line 495
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 498
    .restart local v0    # "packet":Ljava/lang/Object;
    :cond_1
    instance-of v4, v0, [B

    if-eqz v4, :cond_0

    .line 499
    iget-object v4, p0, Lio/socket/client/Manager$10;->val$self:Lio/socket/client/Manager;

    iget-object v4, v4, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    check-cast v0, [B

    .end local v0    # "packet":Ljava/lang/Object;
    check-cast v0, [B

    invoke-virtual {v4, v0}, Lio/socket/engineio/client/Socket;->write([B)V

    goto :goto_1

    .line 502
    :cond_2
    iget-object v1, p0, Lio/socket/client/Manager$10;->val$self:Lio/socket/client/Manager;

    invoke-static {v1, v2}, Lio/socket/client/Manager;->access$1902(Lio/socket/client/Manager;Z)Z

    .line 503
    iget-object v1, p0, Lio/socket/client/Manager$10;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$2000(Lio/socket/client/Manager;)V

    .line 504
    return-void
.end method
