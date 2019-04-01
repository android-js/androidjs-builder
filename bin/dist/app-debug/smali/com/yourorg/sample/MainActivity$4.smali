.class Lcom/yourorg/sample/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yourorg/sample/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yourorg/sample/MainActivity;

.field final synthetic val$socket:Lio/socket/client/Socket;


# direct methods
.method constructor <init>(Lcom/yourorg/sample/MainActivity;Lio/socket/client/Socket;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yourorg/sample/MainActivity;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/yourorg/sample/MainActivity$4;->this$0:Lcom/yourorg/sample/MainActivity;

    iput-object p2, p0, Lcom/yourorg/sample/MainActivity$4;->val$socket:Lio/socket/client/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 5
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/yourorg/sample/MainActivity$4;->val$socket:Lio/socket/client/Socket;

    const-string v1, "foo"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "hi"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 71
    return-void
.end method
