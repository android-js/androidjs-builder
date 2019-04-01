.class Lio/socket/parser/IOParser$BinaryReconstructor;
.super Ljava/lang/Object;
.source "IOParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/IOParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BinaryReconstructor"
.end annotation


# instance fields
.field buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field public reconPack:Lio/socket/parser/Packet;


# direct methods
.method constructor <init>(Lio/socket/parser/Packet;)V
    .locals 1
    .param p1, "packet"    # Lio/socket/parser/Packet;

    .prologue
    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    iput-object p1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 218
    return-void
.end method


# virtual methods
.method public finishReconstruction()V
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    .line 233
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 234
    return-void
.end method

.method public takeBinaryData([B)Lio/socket/parser/Packet;
    .locals 4
    .param p1, "binData"    # [B

    .prologue
    .line 221
    iget-object v1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    iget-object v1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v2, v2, Lio/socket/parser/Packet;->attachments:I

    if-ne v1, v2, :cond_0

    .line 223
    iget-object v2, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget-object v1, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    iget-object v3, p0, Lio/socket/parser/IOParser$BinaryReconstructor;->buffers:Ljava/util/List;

    .line 224
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [[B

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    .line 223
    invoke-static {v2, v1}, Lio/socket/parser/Binary;->reconstructPacket(Lio/socket/parser/Packet;[[B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 225
    .local v0, "packet":Lio/socket/parser/Packet;
    invoke-virtual {p0}, Lio/socket/parser/IOParser$BinaryReconstructor;->finishReconstruction()V

    .line 228
    .end local v0    # "packet":Lio/socket/parser/Packet;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
