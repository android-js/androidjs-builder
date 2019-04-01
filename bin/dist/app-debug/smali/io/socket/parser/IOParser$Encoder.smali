.class public final Lio/socket/parser/IOParser$Encoder;
.super Ljava/lang/Object;
.source "IOParser.java"

# interfaces
.implements Lio/socket/parser/Parser$Encoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/IOParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Encoder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private encodeAsBinary(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V
    .locals 4
    .param p1, "obj"    # Lio/socket/parser/Packet;
    .param p2, "callback"    # Lio/socket/parser/Parser$Encoder$Callback;

    .prologue
    .line 73
    invoke-static {p1}, Lio/socket/parser/Binary;->deconstructPacket(Lio/socket/parser/Packet;)Lio/socket/parser/Binary$DeconstructedPacket;

    move-result-object v1

    .line 74
    .local v1, "deconstruction":Lio/socket/parser/Binary$DeconstructedPacket;
    iget-object v3, v1, Lio/socket/parser/Binary$DeconstructedPacket;->packet:Lio/socket/parser/Packet;

    invoke-direct {p0, v3}, Lio/socket/parser/IOParser$Encoder;->encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "pack":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, v1, Lio/socket/parser/Binary$DeconstructedPacket;->buffers:[[B

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 77
    .local v0, "buffers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 78
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p2, v3}, Lio/socket/parser/Parser$Encoder$Callback;->call([Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method private encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;
    .locals 5
    .param p1, "obj"    # Lio/socket/parser/Packet;

    .prologue
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lio/socket/parser/Packet;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "str":Ljava/lang/StringBuilder;
    const/4 v1, 0x5

    iget v2, p1, Lio/socket/parser/Packet;->type:I

    if-eq v1, v2, :cond_0

    const/4 v1, 0x6

    iget v2, p1, Lio/socket/parser/Packet;->type:I

    if-ne v1, v2, :cond_1

    .line 49
    :cond_0
    iget v1, p1, Lio/socket/parser/Packet;->attachments:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_1
    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "/"

    iget-object v2, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 54
    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    :cond_2
    iget v1, p1, Lio/socket/parser/Packet;->id:I

    if-ltz v1, :cond_3

    .line 59
    iget v1, p1, Lio/socket/parser/Packet;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    :cond_3
    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    if-eqz v1, :cond_4

    .line 63
    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    :cond_4
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 67
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "encoded %s as %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 69
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public encode(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V
    .locals 8
    .param p1, "obj"    # Lio/socket/parser/Packet;
    .param p2, "callback"    # Lio/socket/parser/Parser$Encoder$Callback;

    .prologue
    const/4 v3, 0x6

    const/4 v2, 0x5

    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 29
    iget v1, p1, Lio/socket/parser/Packet;->type:I

    if-eq v1, v5, :cond_0

    iget v1, p1, Lio/socket/parser/Packet;->type:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_1

    :cond_0
    iget-object v1, p1, Lio/socket/parser/Packet;->data:Ljava/lang/Object;

    invoke-static {v1}, Lio/socket/hasbinary/HasBinary;->hasBinary(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 30
    iget v1, p1, Lio/socket/parser/Packet;->type:I

    if-ne v1, v5, :cond_4

    move v1, v2

    :goto_0
    iput v1, p1, Lio/socket/parser/Packet;->type:I

    .line 33
    :cond_1
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 34
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v4, "encoding packet %s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 37
    :cond_2
    iget v1, p1, Lio/socket/parser/Packet;->type:I

    if-eq v2, v1, :cond_3

    iget v1, p1, Lio/socket/parser/Packet;->type:I

    if-ne v3, v1, :cond_5

    .line 38
    :cond_3
    invoke-direct {p0, p1, p2}, Lio/socket/parser/IOParser$Encoder;->encodeAsBinary(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V

    .line 43
    :goto_1
    return-void

    :cond_4
    move v1, v3

    .line 30
    goto :goto_0

    .line 40
    :cond_5
    invoke-direct {p0, p1}, Lio/socket/parser/IOParser$Encoder;->encodeAsString(Lio/socket/parser/Packet;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "encoding":Ljava/lang/String;
    new-array v1, v7, [Ljava/lang/String;

    aput-object v0, v1, v6

    invoke-interface {p2, v1}, Lio/socket/parser/Parser$Encoder$Callback;->call([Ljava/lang/Object;)V

    goto :goto_1
.end method
