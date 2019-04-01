.class Lio/socket/engineio/parser/Buffer;
.super Ljava/lang/Object;
.source "Parser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 340
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static concat([[B)[B
    .locals 5
    .param p0, "list"    # [[B

    .prologue
    .line 343
    const/4 v1, 0x0

    .line 344
    .local v1, "length":I
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, p0, v2

    .line 345
    .local v0, "buf":[B
    array-length v4, v0

    add-int/2addr v1, v4

    .line 344
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 347
    .end local v0    # "buf":[B
    :cond_0
    invoke-static {p0, v1}, Lio/socket/engineio/parser/Buffer;->concat([[BI)[B

    move-result-object v2

    return-object v2
.end method

.method public static concat([[BI)[B
    .locals 5
    .param p0, "list"    # [[B
    .param p1, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 351
    array-length v3, p0

    if-nez v3, :cond_0

    .line 352
    new-array v2, v2, [B

    .line 362
    :goto_0
    return-object v2

    .line 353
    :cond_0
    array-length v3, p0

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 354
    aget-object v2, p0, v2

    goto :goto_0

    .line 357
    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 358
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    array-length v3, p0

    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v0, p0, v2

    .line 359
    .local v0, "buf":[B
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 358
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 362
    .end local v0    # "buf":[B
    :cond_2
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    goto :goto_0
.end method
