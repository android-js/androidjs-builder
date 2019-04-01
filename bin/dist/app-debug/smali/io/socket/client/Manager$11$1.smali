.class Lio/socket/client/Manager$11$1;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Manager$11;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$11;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$11;

    .prologue
    .line 579
    iput-object p1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 582
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$300(Lio/socket/client/Manager;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 606
    :cond_0
    :goto_0
    return-void

    .line 584
    :cond_1
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "attempting reconnect"

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 585
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$2100(Lio/socket/client/Manager;)Lio/socket/backo/Backoff;

    move-result-object v1

    invoke-virtual {v1}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    .line 586
    .local v0, "attempts":I
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    const-string v2, "reconnect_attempt"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 587
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    const-string v2, "reconnecting"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 590
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v1}, Lio/socket/client/Manager;->access$300(Lio/socket/client/Manager;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 592
    iget-object v1, p0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v1, v1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    new-instance v2, Lio/socket/client/Manager$11$1$1;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$11$1$1;-><init>(Lio/socket/client/Manager$11$1;)V

    invoke-virtual {v1, v2}, Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;

    goto :goto_0
.end method
