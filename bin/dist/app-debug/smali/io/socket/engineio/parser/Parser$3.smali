.class final Lio/socket/engineio/parser/Parser$3;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lio/socket/engineio/parser/Parser$EncodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/parser/Parser;->encodePayloadAsBinary([Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/socket/engineio/parser/Parser$EncodeCallback",
        "<[B>;"
    }
.end annotation


# instance fields
.field final synthetic val$results:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lio/socket/engineio/parser/Parser$3;->val$results:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 163
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lio/socket/engineio/parser/Parser$3;->call([B)V

    return-void
.end method

.method public call([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 166
    iget-object v0, p0, Lio/socket/engineio/parser/Parser$3;->val$results:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    return-void
.end method
