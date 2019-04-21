.class final Lcom/android/tools/fd/runtime/Logging$1;
.super Ljava/lang/Object;
.source "Logging.java"

# interfaces
.implements Lcom/android/tools/fd/common/Log$Logging;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/runtime/Logging;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isLoggable(Ljava/util/logging/Level;)Z
    .locals 2
    .param p1, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 42
    sget-object v0, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    if-ne p1, v0, :cond_0

    .line 43
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    .line 46
    :goto_0
    return v0

    .line 44
    :cond_0
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    if-ne p1, v0, :cond_1

    .line 45
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_0

    .line 46
    :cond_1
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_0
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;)V
    .locals 1
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/tools/fd/runtime/Logging$1;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    return-void
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "string"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    sget-object v0, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    if-ne p1, v0, :cond_2

    .line 53
    if-nez p3, :cond_1

    .line 54
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 58
    :cond_2
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    if-ne p1, v0, :cond_4

    .line 59
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    if-nez p3, :cond_3

    .line 61
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 63
    :cond_3
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2, p3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 66
    :cond_4
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    if-nez p3, :cond_5

    .line 68
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 70
    :cond_5
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
