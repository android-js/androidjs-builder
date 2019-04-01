.class public Lio/socket/engineio/client/Transport$Options;
.super Ljava/lang/Object;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/engineio/client/Transport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# instance fields
.field public callFactory:Lokhttp3/Call$Factory;

.field public hostname:Ljava/lang/String;

.field public path:Ljava/lang/String;

.field public policyPort:I

.field public port:I

.field public query:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public secure:Z

.field protected socket:Lio/socket/engineio/client/Socket;

.field public timestampParam:Ljava/lang/String;

.field public timestampRequests:Z

.field public webSocketFactory:Lokhttp3/WebSocket$Factory;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput v0, p0, Lio/socket/engineio/client/Transport$Options;->port:I

    .line 149
    iput v0, p0, Lio/socket/engineio/client/Transport$Options;->policyPort:I

    return-void
.end method
