.class public Lcom/android/tools/fd/runtime/Logging;
.super Ljava/lang/Object;
.source "Logging.java"


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "InstantRun"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/android/tools/fd/runtime/Logging$1;

    invoke-direct {v0}, Lcom/android/tools/fd/runtime/Logging$1;-><init>()V

    sput-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    .line 75
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
