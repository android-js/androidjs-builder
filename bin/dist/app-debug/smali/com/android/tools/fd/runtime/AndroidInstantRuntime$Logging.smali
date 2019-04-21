.class public interface abstract Lcom/android/tools/fd/runtime/AndroidInstantRuntime$Logging;
.super Ljava/lang/Object;
.source "AndroidInstantRuntime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/runtime/AndroidInstantRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60c
    name = "Logging"
.end annotation


# virtual methods
.method public abstract isLoggable(Ljava/util/logging/Level;)Z
.end method

.method public abstract log(Ljava/util/logging/Level;Ljava/lang/String;)V
.end method

.method public abstract log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method
