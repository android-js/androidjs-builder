.class public final Lio/socket/utf8/UTF8;
.super Ljava/lang/Object;
.source "UTF8.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/utf8/UTF8$Options;
    }
.end annotation


# static fields
.field private static final INVALID_CONTINUATION_BYTE:Ljava/lang/String; = "Invalid continuation byte"

.field private static byteArray:[I

.field private static byteCount:I

.field private static byteIndex:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkScalarValue(IZ)Z
    .locals 3
    .param p0, "codePoint"    # I
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 175
    const v0, 0xd800

    if-lt p0, v0, :cond_1

    const v0, 0xdfff

    if-gt p0, v0, :cond_1

    .line 176
    if-eqz p1, :cond_0

    .line 177
    new-instance v0, Lio/socket/utf8/UTF8Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Lone surrogate U+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 178
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a scalar value"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_0
    const/4 v0, 0x0

    .line 184
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static createByte(II)[C
    .locals 1
    .param p0, "codePoint"    # I
    .param p1, "shift"    # I

    .prologue
    .line 92
    shr-int v0, p0, p1

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "byteString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Lio/socket/utf8/UTF8$Options;

    invoke-direct {v0}, Lio/socket/utf8/UTF8$Options;-><init>()V

    invoke-static {p0, v0}, Lio/socket/utf8/UTF8;->decode(Ljava/lang/String;Lio/socket/utf8/UTF8$Options;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;Lio/socket/utf8/UTF8$Options;)Ljava/lang/String;
    .locals 4
    .param p0, "byteString"    # Ljava/lang/String;
    .param p1, "opts"    # Lio/socket/utf8/UTF8$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 44
    iget-boolean v1, p1, Lio/socket/utf8/UTF8$Options;->strict:Z

    .line 46
    .local v1, "strict":Z
    invoke-static {p0}, Lio/socket/utf8/UTF8;->ucs2decode(Ljava/lang/String;)[I

    move-result-object v3

    sput-object v3, Lio/socket/utf8/UTF8;->byteArray:[I

    .line 47
    sget-object v3, Lio/socket/utf8/UTF8;->byteArray:[I

    array-length v3, v3

    sput v3, Lio/socket/utf8/UTF8;->byteCount:I

    .line 48
    const/4 v3, 0x0

    sput v3, Lio/socket/utf8/UTF8;->byteIndex:I

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v0, "codePoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_0
    invoke-static {v1}, Lio/socket/utf8/UTF8;->decodeSymbol(Z)I

    move-result v2

    .local v2, "tmp":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 54
    :cond_0
    invoke-static {v0}, Lio/socket/utf8/UTF8;->listToArray(Ljava/util/List;)[I

    move-result-object v3

    invoke-static {v3}, Lio/socket/utf8/UTF8;->ucs2encode([I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static decodeSymbol(Z)I
    .locals 7
    .param p0, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 102
    sget v5, Lio/socket/utf8/UTF8;->byteIndex:I

    sget v6, Lio/socket/utf8/UTF8;->byteCount:I

    if-le v5, v6, :cond_0

    .line 103
    new-instance v5, Lio/socket/utf8/UTF8Exception;

    const-string v6, "Invalid byte index"

    invoke-direct {v5, v6}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v5

    .line 106
    :cond_0
    sget v5, Lio/socket/utf8/UTF8;->byteIndex:I

    sget v6, Lio/socket/utf8/UTF8;->byteCount:I

    if-ne v5, v6, :cond_2

    .line 107
    const/4 v4, -0x1

    .line 144
    :cond_1
    :goto_0
    return v4

    .line 110
    :cond_2
    sget-object v5, Lio/socket/utf8/UTF8;->byteArray:[I

    sget v6, Lio/socket/utf8/UTF8;->byteIndex:I

    aget v5, v5, v6

    and-int/lit16 v0, v5, 0xff

    .line 111
    .local v0, "byte1":I
    sget v5, Lio/socket/utf8/UTF8;->byteIndex:I

    add-int/lit8 v5, v5, 0x1

    sput v5, Lio/socket/utf8/UTF8;->byteIndex:I

    .line 113
    and-int/lit16 v5, v0, 0x80

    if-nez v5, :cond_3

    move v4, v0

    .line 114
    goto :goto_0

    .line 117
    :cond_3
    and-int/lit16 v5, v0, 0xe0

    const/16 v6, 0xc0

    if-ne v5, v6, :cond_4

    .line 118
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v1

    .line 119
    .local v1, "byte2":I
    and-int/lit8 v5, v0, 0x1f

    shl-int/lit8 v5, v5, 0x6

    or-int v4, v5, v1

    .line 120
    .local v4, "codePoint":I
    const/16 v5, 0x80

    if-ge v4, v5, :cond_1

    .line 123
    new-instance v5, Lio/socket/utf8/UTF8Exception;

    const-string v6, "Invalid continuation byte"

    invoke-direct {v5, v6}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v5

    .line 127
    .end local v1    # "byte2":I
    .end local v4    # "codePoint":I
    :cond_4
    and-int/lit16 v5, v0, 0xf0

    const/16 v6, 0xe0

    if-ne v5, v6, :cond_6

    .line 128
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v1

    .line 129
    .restart local v1    # "byte2":I
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v2

    .line 130
    .local v2, "byte3":I
    and-int/lit8 v5, v0, 0xf

    shl-int/lit8 v5, v5, 0xc

    shl-int/lit8 v6, v1, 0x6

    or-int/2addr v5, v6

    or-int v4, v5, v2

    .line 131
    .restart local v4    # "codePoint":I
    const/16 v5, 0x800

    if-lt v4, v5, :cond_5

    .line 132
    invoke-static {v4, p0}, Lio/socket/utf8/UTF8;->checkScalarValue(IZ)Z

    move-result v5

    if-nez v5, :cond_1

    const v4, 0xfffd

    goto :goto_0

    .line 134
    :cond_5
    new-instance v5, Lio/socket/utf8/UTF8Exception;

    const-string v6, "Invalid continuation byte"

    invoke-direct {v5, v6}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v5

    .line 138
    .end local v1    # "byte2":I
    .end local v2    # "byte3":I
    .end local v4    # "codePoint":I
    :cond_6
    and-int/lit16 v5, v0, 0xf8

    const/16 v6, 0xf0

    if-ne v5, v6, :cond_7

    .line 139
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v1

    .line 140
    .restart local v1    # "byte2":I
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v2

    .line 141
    .restart local v2    # "byte3":I
    invoke-static {}, Lio/socket/utf8/UTF8;->readContinuationByte()I

    move-result v3

    .line 142
    .local v3, "byte4":I
    and-int/lit8 v5, v0, 0xf

    shl-int/lit8 v5, v5, 0x12

    shl-int/lit8 v6, v1, 0xc

    or-int/2addr v5, v6

    shl-int/lit8 v6, v2, 0x6

    or-int/2addr v5, v6

    or-int v4, v5, v3

    .line 143
    .restart local v4    # "codePoint":I
    const/high16 v5, 0x10000

    if-lt v4, v5, :cond_7

    const v5, 0x10ffff

    if-le v4, v5, :cond_1

    .line 148
    .end local v1    # "byte2":I
    .end local v2    # "byte3":I
    .end local v3    # "byte4":I
    .end local v4    # "codePoint":I
    :cond_7
    new-instance v5, Lio/socket/utf8/UTF8Exception;

    const-string v6, "Invalid continuation byte"

    invoke-direct {v5, v6}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 21
    new-instance v0, Lio/socket/utf8/UTF8$Options;

    invoke-direct {v0}, Lio/socket/utf8/UTF8$Options;-><init>()V

    invoke-static {p0, v0}, Lio/socket/utf8/UTF8;->encode(Ljava/lang/String;Lio/socket/utf8/UTF8$Options;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Ljava/lang/String;Lio/socket/utf8/UTF8$Options;)Ljava/lang/String;
    .locals 7
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "opts"    # Lio/socket/utf8/UTF8$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 25
    iget-boolean v5, p1, Lio/socket/utf8/UTF8$Options;->strict:Z

    .line 27
    .local v5, "strict":Z
    invoke-static {p0}, Lio/socket/utf8/UTF8;->ucs2decode(Ljava/lang/String;)[I

    move-result-object v2

    .line 28
    .local v2, "codePoints":[I
    array-length v4, v2

    .line 29
    .local v4, "length":I
    const/4 v3, -0x1

    .line 31
    .local v3, "index":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v0, "byteString":Ljava/lang/StringBuilder;
    :goto_0
    add-int/lit8 v3, v3, 0x1

    if-ge v3, v4, :cond_0

    .line 33
    aget v1, v2, v3

    .line 34
    .local v1, "codePoint":I
    invoke-static {v1, v5}, Lio/socket/utf8/UTF8;->encodeCodePoint(IZ)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 36
    .end local v1    # "codePoint":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method private static encodeCodePoint(IZ)Ljava/lang/String;
    .locals 3
    .param p0, "codePoint"    # I
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x6

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "symbol":Ljava/lang/StringBuilder;
    and-int/lit8 v1, p0, -0x80

    if-nez v1, :cond_0

    .line 72
    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 88
    :goto_0
    return-object v1

    .line 74
    :cond_0
    and-int/lit16 v1, p0, -0x800

    if-nez v1, :cond_2

    .line 75
    shr-int/lit8 v1, p0, 0x6

    and-int/lit8 v1, v1, 0x1f

    or-int/lit16 v1, v1, 0xc0

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 87
    :cond_1
    :goto_1
    and-int/lit8 v1, p0, 0x3f

    or-int/lit16 v1, v1, 0x80

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 76
    :cond_2
    const/high16 v1, -0x10000

    and-int/2addr v1, p0

    if-nez v1, :cond_4

    .line 77
    invoke-static {p0, p1}, Lio/socket/utf8/UTF8;->checkScalarValue(IZ)Z

    move-result v1

    if-nez v1, :cond_3

    .line 78
    const p0, 0xfffd

    .line 80
    :cond_3
    shr-int/lit8 v1, p0, 0xc

    and-int/lit8 v1, v1, 0xf

    or-int/lit16 v1, v1, 0xe0

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 81
    invoke-static {p0, v2}, Lio/socket/utf8/UTF8;->createByte(II)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 82
    :cond_4
    const/high16 v1, -0x200000

    and-int/2addr v1, p0

    if-nez v1, :cond_1

    .line 83
    shr-int/lit8 v1, p0, 0x12

    and-int/lit8 v1, v1, 0x7

    or-int/lit16 v1, v1, 0xf0

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 84
    const/16 v1, 0xc

    invoke-static {p0, v1}, Lio/socket/utf8/UTF8;->createByte(II)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 85
    invoke-static {p0, v2}, Lio/socket/utf8/UTF8;->createByte(II)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static listToArray(Ljava/util/List;)[I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 188
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 189
    .local v2, "size":I
    new-array v0, v2, [I

    .line 190
    .local v0, "array":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 191
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v0, v1

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 193
    :cond_0
    return-object v0
.end method

.method private static readContinuationByte()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/socket/utf8/UTF8Exception;
        }
    .end annotation

    .prologue
    .line 152
    sget v1, Lio/socket/utf8/UTF8;->byteIndex:I

    sget v2, Lio/socket/utf8/UTF8;->byteCount:I

    if-lt v1, v2, :cond_0

    .line 153
    new-instance v1, Lio/socket/utf8/UTF8Exception;

    const-string v2, "Invalid byte index"

    invoke-direct {v1, v2}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_0
    sget-object v1, Lio/socket/utf8/UTF8;->byteArray:[I

    sget v2, Lio/socket/utf8/UTF8;->byteIndex:I

    aget v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 157
    .local v0, "continuationByte":I
    sget v1, Lio/socket/utf8/UTF8;->byteIndex:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lio/socket/utf8/UTF8;->byteIndex:I

    .line 159
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-ne v1, v2, :cond_1

    .line 160
    and-int/lit8 v1, v0, 0x3f

    return v1

    .line 163
    :cond_1
    new-instance v1, Lio/socket/utf8/UTF8Exception;

    const-string v2, "Invalid continuation byte"

    invoke-direct {v1, v2}, Lio/socket/utf8/UTF8Exception;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static ucs2decode(Ljava/lang/String;)[I
    .locals 7
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 59
    .local v3, "length":I
    const/4 v6, 0x0

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->codePointCount(II)I

    move-result v6

    new-array v4, v6, [I

    .line 60
    .local v4, "output":[I
    const/4 v0, 0x0

    .line 62
    .local v0, "counter":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v1, v0

    .end local v0    # "counter":I
    .local v1, "counter":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 63
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v5

    .line 64
    .local v5, "value":I
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "counter":I
    .restart local v0    # "counter":I
    aput v5, v4, v1

    .line 62
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    add-int/2addr v2, v6

    move v1, v0

    .end local v0    # "counter":I
    .restart local v1    # "counter":I
    goto :goto_0

    .line 66
    .end local v5    # "value":I
    :cond_0
    return-object v4
.end method

.method private static ucs2encode([I)Ljava/lang/String;
    .locals 4
    .param p0, "array"    # [I

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .local v0, "output":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget v1, p0, v2

    .line 169
    .local v1, "value":I
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 168
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    .end local v1    # "value":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
