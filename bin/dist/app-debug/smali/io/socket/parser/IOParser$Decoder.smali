.class public final Lio/socket/parser/IOParser$Decoder;
.super Ljava/lang/Object;
.source "IOParser.java"

# interfaces
.implements Lio/socket/parser/Parser$Decoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/IOParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Decoder"
.end annotation


# instance fields
.field private onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

.field reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 90
    return-void
.end method

.method private static decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;
    .locals 14
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 126
    const/4 v3, 0x0

    .line 127
    .local v3, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 129
    .local v5, "length":I
    new-instance v8, Lio/socket/parser/Packet;

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v9

    invoke-direct {v8, v9}, Lio/socket/parser/Packet;-><init>(I)V

    .line 131
    .local v8, "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    iget v9, v8, Lio/socket/parser/Packet;->type:I

    if-ltz v9, :cond_0

    iget v9, v8, Lio/socket/parser/Packet;->type:I

    sget-object v10, Lio/socket/parser/Parser;->types:[Ljava/lang/String;

    array-length v10, v10

    add-int/lit8 v10, v10, -0x1

    if-le v9, v10, :cond_2

    :cond_0
    invoke-static {}, Lio/socket/parser/IOParser;->access$100()Lio/socket/parser/Packet;

    move-result-object v8

    .line 191
    .end local v8    # "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    :cond_1
    :goto_0
    return-object v8

    .line 133
    .restart local v8    # "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    :cond_2
    const/4 v9, 0x5

    iget v10, v8, Lio/socket/parser/Packet;->type:I

    if-eq v9, v10, :cond_3

    const/4 v9, 0x6

    iget v10, v8, Lio/socket/parser/Packet;->type:I

    if-ne v9, v10, :cond_7

    .line 134
    :cond_3
    const-string v9, "-"

    invoke-virtual {p0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    if-gt v5, v13, :cond_5

    :cond_4
    invoke-static {}, Lio/socket/parser/IOParser;->access$100()Lio/socket/parser/Packet;

    move-result-object v8

    goto :goto_0

    .line 135
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .local v0, "attachments":Ljava/lang/StringBuilder;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-eq v9, v10, :cond_6

    .line 137
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 139
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lio/socket/parser/Packet;->attachments:I

    .line 142
    .end local v0    # "attachments":Ljava/lang/StringBuilder;
    :cond_7
    add-int/lit8 v9, v3, 0x1

    if-le v5, v9, :cond_d

    const/16 v9, 0x2f

    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v9, v10, :cond_d

    .line 143
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .local v7, "nsp":Ljava/lang/StringBuilder;
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 146
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 147
    .local v1, "c":C
    const/16 v9, 0x2c

    if-ne v9, v1, :cond_c

    .line 151
    :goto_2
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 156
    .end local v1    # "c":C
    .end local v7    # "nsp":Ljava/lang/StringBuilder;
    :goto_3
    add-int/lit8 v9, v3, 0x1

    if-le v5, v9, :cond_a

    .line 157
    add-int/lit8 v9, v3, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    .line 158
    .local v6, "next":Ljava/lang/Character;
    invoke-virtual {v6}, Ljava/lang/Character;->charValue()C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v9

    const/4 v10, -0x1

    if-le v9, v10, :cond_a

    .line 159
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v4, "id":Ljava/lang/StringBuilder;
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 162
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 163
    .restart local v1    # "c":C
    invoke-static {v1}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v9

    if-gez v9, :cond_e

    .line 164
    add-int/lit8 v3, v3, -0x1

    .line 171
    :goto_4
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lio/socket/parser/Packet;->id:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v1    # "c":C
    .end local v4    # "id":Ljava/lang/StringBuilder;
    .end local v6    # "next":Ljava/lang/Character;
    :cond_a
    add-int/lit8 v9, v3, 0x1

    if-le v5, v9, :cond_b

    .line 180
    add-int/lit8 v3, v3, 0x1

    :try_start_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 181
    new-instance v9, Lorg/json/JSONTokener;

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v8, Lio/socket/parser/Packet;->data:Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 188
    :cond_b
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v9

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 189
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v9

    const-string v10, "decoded %s as %s"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    aput-object p0, v11, v12

    aput-object v8, v11, v13

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 148
    .restart local v1    # "c":C
    .restart local v7    # "nsp":Ljava/lang/StringBuilder;
    :cond_c
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    add-int/lit8 v9, v3, 0x1

    if-ne v9, v5, :cond_8

    goto :goto_2

    .line 153
    .end local v1    # "c":C
    .end local v7    # "nsp":Ljava/lang/StringBuilder;
    :cond_d
    const-string v9, "/"

    iput-object v9, v8, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    goto :goto_3

    .line 167
    .restart local v1    # "c":C
    .restart local v4    # "id":Ljava/lang/StringBuilder;
    .restart local v6    # "next":Ljava/lang/Character;
    :cond_e
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    add-int/lit8 v9, v3, 0x1

    if-ne v9, v5, :cond_9

    goto :goto_4

    .line 172
    :catch_0
    move-exception v2

    .line 173
    .local v2, "e":Ljava/lang/NumberFormatException;
    invoke-static {}, Lio/socket/parser/IOParser;->access$100()Lio/socket/parser/Packet;

    move-result-object v8

    goto/16 :goto_0

    .line 182
    .end local v1    # "c":C
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "id":Ljava/lang/StringBuilder;
    .end local v6    # "next":Ljava/lang/Character;
    :catch_1
    move-exception v2

    .line 183
    .local v2, "e":Lorg/json/JSONException;
    invoke-static {}, Lio/socket/parser/IOParser;->access$000()Ljava/util/logging/Logger;

    move-result-object v9

    sget-object v10, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v11, "An error occured while retrieving data from JSONTokener"

    invoke-virtual {v9, v10, v11, v2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    invoke-static {}, Lio/socket/parser/IOParser;->access$100()Lio/socket/parser/Packet;

    move-result-object v8

    goto/16 :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-static {p1}, Lio/socket/parser/IOParser$Decoder;->decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;

    move-result-object v0

    .line 95
    .local v0, "packet":Lio/socket/parser/Packet;
    const/4 v1, 0x5

    iget v2, v0, Lio/socket/parser/Packet;->type:I

    if-eq v1, v2, :cond_0

    const/4 v1, 0x6

    iget v2, v0, Lio/socket/parser/Packet;->type:I

    if-ne v1, v2, :cond_2

    .line 96
    :cond_0
    new-instance v1, Lio/socket/parser/IOParser$BinaryReconstructor;

    invoke-direct {v1, v0}, Lio/socket/parser/IOParser$BinaryReconstructor;-><init>(Lio/socket/parser/Packet;)V

    iput-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 98
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    iget-object v1, v1, Lio/socket/parser/IOParser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v1, v1, Lio/socket/parser/Packet;->attachments:I

    if-nez v1, :cond_1

    .line 99
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    .line 108
    :cond_1
    :goto_0
    return-void

    .line 104
    :cond_2
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_1

    .line 105
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    goto :goto_0
.end method

.method public add([B)V
    .locals 3
    .param p1, "obj"    # [B

    .prologue
    .line 112
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    if-nez v1, :cond_0

    .line 113
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "got binary data when not reconstructing a packet"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 115
    :cond_0
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    invoke-virtual {v1, p1}, Lio/socket/parser/IOParser$BinaryReconstructor;->takeBinaryData([B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 116
    .local v0, "packet":Lio/socket/parser/Packet;
    if-eqz v0, :cond_1

    .line 117
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    .line 118
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    if-eqz v1, :cond_1

    .line 119
    iget-object v1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    invoke-interface {v1, v0}, Lio/socket/parser/Parser$Decoder$Callback;->call(Lio/socket/parser/Packet;)V

    .line 123
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lio/socket/parser/IOParser$Decoder;->reconstructor:Lio/socket/parser/IOParser$BinaryReconstructor;

    invoke-virtual {v0}, Lio/socket/parser/IOParser$BinaryReconstructor;->finishReconstruction()V

    .line 199
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    .line 200
    return-void
.end method

.method public onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V
    .locals 0
    .param p1, "callback"    # Lio/socket/parser/Parser$Decoder$Callback;

    .prologue
    .line 204
    iput-object p1, p0, Lio/socket/parser/IOParser$Decoder;->onDecodedCallback:Lio/socket/parser/Parser$Decoder$Callback;

    .line 205
    return-void
.end method
