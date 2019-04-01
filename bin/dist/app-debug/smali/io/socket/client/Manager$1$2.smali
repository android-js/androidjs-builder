.class Lio/socket/client/Manager$1$2;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/client/Manager$1;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager$1;Lio/socket/client/Manager;)V
    .locals 0
    .param p1, "this$1"    # Lio/socket/client/Manager$1;

    .prologue
    .line 291
    iput-object p1, p0, Lio/socket/client/Manager$1$2;->this$1:Lio/socket/client/Manager$1;

    iput-object p2, p0, Lio/socket/client/Manager$1$2;->val$self:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 2
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 294
    iget-object v0, p0, Lio/socket/client/Manager$1$2;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$400(Lio/socket/client/Manager;)V

    .line 295
    iget-object v0, p0, Lio/socket/client/Manager$1$2;->this$1:Lio/socket/client/Manager$1;

    iget-object v0, v0, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/socket/client/Manager$1$2;->this$1:Lio/socket/client/Manager$1;

    iget-object v0, v0, Lio/socket/client/Manager$1;->val$fn:Lio/socket/client/Manager$OpenCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lio/socket/client/Manager$OpenCallback;->call(Ljava/lang/Exception;)V

    .line 296
    :cond_0
    return-void
.end method
