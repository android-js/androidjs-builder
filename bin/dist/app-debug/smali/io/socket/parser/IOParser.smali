.class public final Lio/socket/parser/IOParser;
.super Ljava/lang/Object;
.source "IOParser.java"

# interfaces
.implements Lio/socket/parser/Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/parser/IOParser$BinaryReconstructor;,
        Lio/socket/parser/IOParser$Decoder;,
        Lio/socket/parser/IOParser$Encoder;
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lio/socket/parser/IOParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/parser/IOParser;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lio/socket/parser/IOParser;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$100()Lio/socket/parser/Packet;
    .locals 1

    .prologue
    .line 13
    invoke-static {}, Lio/socket/parser/IOParser;->error()Lio/socket/parser/Packet;

    move-result-object v0

    return-object v0
.end method

.method private static error()Lio/socket/parser/Packet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/socket/parser/Packet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lio/socket/parser/Packet;

    const/4 v1, 0x4

    const-string v2, "parser error"

    invoke-direct {v0, v1, v2}, Lio/socket/parser/Packet;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method
