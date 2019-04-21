.class final Lcom/android/tools/fd/runtime/Restarter$1;
.super Ljava/lang/Object;
.source "Restarter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/tools/fd/runtime/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/android/tools/fd/runtime/Restarter$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 60
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    const-string/jumbo v0, "InstantRun"

    const-string/jumbo v1, "Resources updated: notify activities"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Restarter$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/tools/fd/runtime/Restarter;->access$000(Landroid/app/Activity;)V

    .line 64
    return-void
.end method
