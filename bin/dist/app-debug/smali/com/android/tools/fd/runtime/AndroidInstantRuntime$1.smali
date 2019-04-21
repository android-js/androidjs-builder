.class final Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;
.super Ljava/lang/Object;
.source "AndroidInstantRuntime.java"

# interfaces
.implements Lcom/android/tools/fd/common/Log$Logging;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->setLogger(Ljava/util/logging/Logger;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$logger:Ljava/util/logging/Logger;


# direct methods
.method constructor <init>(Ljava/util/logging/Logger;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;->val$logger:Ljava/util/logging/Logger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isLoggable(Ljava/util/logging/Level;)Z
    .locals 1
    .param p1, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;->val$logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;)V
    .locals 1
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;->val$logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "string"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;->val$logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    return-void
.end method
