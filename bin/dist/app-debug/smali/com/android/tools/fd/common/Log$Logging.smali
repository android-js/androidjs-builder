.class public interface abstract Lcom/android/tools/fd/common/Log$Logging;
.super Ljava/lang/Object;
.source "Log.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/common/Log;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Logging"
.end annotation


# virtual methods
.method public abstract isLoggable(Ljava/util/logging/Level;)Z
.end method

.method public abstract log(Ljava/util/logging/Level;Ljava/lang/String;)V
.end method

.method public abstract log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method
