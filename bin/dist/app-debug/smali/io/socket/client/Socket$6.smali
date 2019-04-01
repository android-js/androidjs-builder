.class Lio/socket/client/Socket$6;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;Lio/socket/client/Ack;)Lio/socket/emitter/Emitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Socket;

.field final synthetic val$ack:Lio/socket/client/Ack;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;Lio/socket/client/Ack;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Socket;

    .prologue
    .line 220
    iput-object p1, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    iput-object p2, p0, Lio/socket/client/Socket$6;->val$event:Ljava/lang/String;

    iput-object p3, p0, Lio/socket/client/Socket$6;->val$args:[Ljava/lang/Object;

    iput-object p4, p0, Lio/socket/client/Socket$6;->val$ack:Lio/socket/client/Ack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 223
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 224
    .local v1, "jsonArgs":Lorg/json/JSONArray;
    iget-object v3, p0, Lio/socket/client/Socket$6;->val$event:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 226
    iget-object v3, p0, Lio/socket/client/Socket$6;->val$args:[Ljava/lang/Object;

    if-eqz v3, :cond_0

    .line 227
    iget-object v5, p0, Lio/socket/client/Socket$6;->val$args:[Ljava/lang/Object;

    array-length v6, v5

    move v3, v4

    :goto_0
    if-ge v3, v6, :cond_0

    aget-object v0, v5, v3

    .line 228
    .local v0, "arg":Ljava/lang/Object;
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 227
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 232
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_0
    new-instance v2, Lio/socket/parser/Packet;

    const/4 v3, 0x2

    invoke-direct {v2, v3, v1}, Lio/socket/parser/Packet;-><init>(ILjava/lang/Object;)V

    .line 234
    .local v2, "packet":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Lorg/json/JSONArray;>;"
    iget-object v3, p0, Lio/socket/client/Socket$6;->val$ack:Lio/socket/client/Ack;

    if-eqz v3, :cond_1

    .line 235
    invoke-static {}, Lio/socket/client/Socket;->access$800()Ljava/util/logging/Logger;

    move-result-object v3

    const-string v5, "emitting packet with ack id %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v7}, Lio/socket/client/Socket;->access$700(Lio/socket/client/Socket;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 236
    iget-object v3, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v3}, Lio/socket/client/Socket;->access$900(Lio/socket/client/Socket;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v4}, Lio/socket/client/Socket;->access$700(Lio/socket/client/Socket;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lio/socket/client/Socket$6;->val$ack:Lio/socket/client/Ack;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    iget-object v3, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v3}, Lio/socket/client/Socket;->access$708(Lio/socket/client/Socket;)I

    move-result v3

    iput v3, v2, Lio/socket/parser/Packet;->id:I

    .line 240
    :cond_1
    iget-object v3, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v3}, Lio/socket/client/Socket;->access$300(Lio/socket/client/Socket;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 241
    iget-object v3, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v3, v2}, Lio/socket/client/Socket;->access$1000(Lio/socket/client/Socket;Lio/socket/parser/Packet;)V

    .line 245
    :goto_1
    return-void

    .line 243
    :cond_2
    iget-object v3, p0, Lio/socket/client/Socket$6;->this$0:Lio/socket/client/Socket;

    invoke-static {v3}, Lio/socket/client/Socket;->access$1100(Lio/socket/client/Socket;)Ljava/util/Queue;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
