.class Lio/socket/client/Manager$9;
.super Ljava/lang/Object;
.source "Manager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;

.field final synthetic val$nsp:Ljava/lang/String;

.field final synthetic val$s:Lio/socket/client/Socket;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method constructor <init>(Lio/socket/client/Manager;Lio/socket/client/Socket;Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lio/socket/client/Manager;

    .prologue
    .line 458
    iput-object p1, p0, Lio/socket/client/Manager$9;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$9;->val$s:Lio/socket/client/Socket;

    iput-object p3, p0, Lio/socket/client/Manager$9;->val$self:Lio/socket/client/Manager;

    iput-object p4, p0, Lio/socket/client/Manager$9;->val$nsp:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 3
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 461
    iget-object v0, p0, Lio/socket/client/Manager$9;->val$s:Lio/socket/client/Socket;

    iget-object v1, p0, Lio/socket/client/Manager$9;->val$self:Lio/socket/client/Manager;

    iget-object v2, p0, Lio/socket/client/Manager$9;->val$nsp:Ljava/lang/String;

    invoke-static {v1, v2}, Lio/socket/client/Manager;->access$1800(Lio/socket/client/Manager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/socket/client/Socket;->id:Ljava/lang/String;

    .line 462
    return-void
.end method
