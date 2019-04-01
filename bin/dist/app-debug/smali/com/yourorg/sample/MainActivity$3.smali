.class Lcom/yourorg/sample/MainActivity$3;
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


# direct methods
.method constructor <init>(Lcom/yourorg/sample/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/yourorg/sample/MainActivity;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/yourorg/sample/MainActivity$3;->this$0:Lcom/yourorg/sample/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .locals 2
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 77
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Hello from node"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 79
    return-void
.end method
