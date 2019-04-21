.class public Lcom/android/tools/fd/common/Log;
.super Ljava/lang/Object;
.source "Log.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/fd/common/Log$Logging;
    }
.end annotation


# static fields
.field public static logging:Lcom/android/tools/fd/common/Log$Logging;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
