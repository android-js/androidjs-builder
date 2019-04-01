.class public Lio/socket/engineio/client/transports/PollingXHR$Request$Options;
.super Ljava/lang/Object;
.source "PollingXHR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/transports/PollingXHR$Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# instance fields
.field public callFactory:Lokhttp3/Call$Factory;

.field public data:Ljava/lang/Object;

.field public method:Ljava/lang/String;

.field public uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
