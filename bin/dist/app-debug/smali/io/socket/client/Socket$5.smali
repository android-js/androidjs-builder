.class Lio/socket/client/Socket$5;
.super Ljava/lang/Object;
.source "Socket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Socket;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Socket;

    .prologue
    .line 182
    iput-object p1, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    iput-object p2, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    iput-object p3, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 185
    sget-object v4, Lio/socket/client/Socket;->events:Ljava/util/Map;

    iget-object v5, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 186
    iget-object v4, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    iget-object v5, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    iget-object v6, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    invoke-static {v4, v5, v6}, Lio/socket/client/Socket;->access$601(Lio/socket/client/Socket;Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 206
    :goto_0
    return-void

    .line 192
    :cond_0
    iget-object v4, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    array-length v4, v4

    add-int/lit8 v3, v4, -0x1

    .line 194
    .local v3, "lastIndex":I
    iget-object v4, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    array-length v4, v4

    if-lez v4, :cond_2

    iget-object v4, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    aget-object v4, v4, v3

    instance-of v4, v4, Lio/socket/client/Ack;

    if-eqz v4, :cond_2

    .line 195
    new-array v0, v3, [Ljava/lang/Object;

    .line 196
    .local v0, "_args":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 197
    iget-object v4, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    aget-object v4, v4, v2

    aput-object v4, v0, v2

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 199
    :cond_1
    iget-object v4, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    aget-object v1, v4, v3

    check-cast v1, Lio/socket/client/Ack;

    .line 205
    .end local v2    # "i":I
    .local v1, "ack":Lio/socket/client/Ack;
    :goto_2
    iget-object v4, p0, Lio/socket/client/Socket$5;->this$0:Lio/socket/client/Socket;

    iget-object v5, p0, Lio/socket/client/Socket$5;->val$event:Ljava/lang/String;

    invoke-virtual {v4, v5, v0, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;Lio/socket/client/Ack;)Lio/socket/emitter/Emitter;

    goto :goto_0

    .line 201
    .end local v0    # "_args":[Ljava/lang/Object;
    .end local v1    # "ack":Lio/socket/client/Ack;
    :cond_2
    iget-object v0, p0, Lio/socket/client/Socket$5;->val$args:[Ljava/lang/Object;

    .line 202
    .restart local v0    # "_args":[Ljava/lang/Object;
    const/4 v1, 0x0

    .restart local v1    # "ack":Lio/socket/client/Ack;
    goto :goto_2
.end method
