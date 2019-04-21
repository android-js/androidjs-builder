.class public Lcom/android/tools/fd/runtime/ApplicationPatch;
.super Ljava/lang/Object;
.source "ApplicationPatch.java"


# instance fields
.field public final data:[B

.field public final path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->path:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->data:[B

    .line 40
    return-void
.end method

.method public static read(Ljava/io/DataInputStream;)Ljava/util/List;
    .locals 10
    .param p0, "input"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/DataInputStream;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/android/tools/fd/runtime/ApplicationPatch;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 55
    .local v1, "changeCount":I
    sget-object v6, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v6, :cond_0

    sget-object v6, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v6, v7}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 56
    sget-object v6, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Receiving "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " changes"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 59
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .local v2, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 61
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "path":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    .line 63
    .local v5, "size":I
    new-array v0, v5, [B

    .line 64
    .local v0, "bytes":[B
    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    .line 65
    new-instance v6, Lcom/android/tools/fd/runtime/ApplicationPatch;

    invoke-direct {v6, v4, v0}, Lcom/android/tools/fd/runtime/ApplicationPatch;-><init>(Ljava/lang/String;[B)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 68
    .end local v0    # "bytes":[B
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "size":I
    :cond_1
    return-object v2
.end method


# virtual methods
.method public getBytes()[B
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->data:[B

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->path:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ApplicationPatch{path=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", data.length=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/tools/fd/runtime/ApplicationPatch;->data:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
