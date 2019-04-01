.class Lio/socket/engineio/client/transports/Polling$2;
.super Ljava/lang/Object;
.source "Polling.java"

# interfaces
.implements Lio/socket/engineio/parser/Parser$DecodePayloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/Polling;->_onData(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/Polling;

.field final synthetic val$self:Lio/socket/engineio/client/transports/Polling;


# direct methods
.method constructor <init>(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/client/transports/Polling;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/engineio/client/transports/Polling;

    .prologue
    .line 115
    iput-object p1, p0, Lio/socket/engineio/client/transports/Polling$2;->this$0:Lio/socket/engineio/client/transports/Polling;

    iput-object p2, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lio/socket/engineio/parser/Packet;II)Z
    .locals 2
    .param p1, "packet"    # Lio/socket/engineio/parser/Packet;
    .param p2, "index"    # I
    .param p3, "total"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v0}, Lio/socket/engineio/client/transports/Polling;->access$400(Lio/socket/engineio/client/transports/Polling;)Lio/socket/engineio/client/Transport$ReadyState;

    move-result-object v0

    sget-object v1, Lio/socket/engineio/client/Transport$ReadyState;->OPENING:Lio/socket/engineio/client/Transport$ReadyState;

    if-ne v0, v1, :cond_0

    .line 119
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v0}, Lio/socket/engineio/client/transports/Polling;->access$500(Lio/socket/engineio/client/transports/Polling;)V

    .line 122
    :cond_0
    const-string v0, "close"

    iget-object v1, p1, Lio/socket/engineio/parser/Packet;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 123
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v0}, Lio/socket/engineio/client/transports/Polling;->access$600(Lio/socket/engineio/client/transports/Polling;)V

    .line 124
    const/4 v0, 0x0

    .line 128
    :goto_0
    return v0

    .line 127
    :cond_1
    iget-object v0, p0, Lio/socket/engineio/client/transports/Polling$2;->val$self:Lio/socket/engineio/client/transports/Polling;

    invoke-static {v0, p1}, Lio/socket/engineio/client/transports/Polling;->access$700(Lio/socket/engineio/client/transports/Polling;Lio/socket/engineio/parser/Packet;)V

    .line 128
    const/4 v0, 0x1

    goto :goto_0
.end method
