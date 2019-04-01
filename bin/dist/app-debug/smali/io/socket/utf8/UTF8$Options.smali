.class public Lio/socket/utf8/UTF8$Options;
.super Ljava/lang/Object;
.source "UTF8.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/utf8/UTF8;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# instance fields
.field public strict:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/utf8/UTF8$Options;->strict:Z

    return-void
.end method
