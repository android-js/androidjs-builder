.class public Lcom/android/tools/fd/runtime/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;,
        Lcom/android/tools/fd/runtime/Server$SocketServerThread;
    }
.end annotation


# static fields
.field private static final POST_ALIVE_STATUS:Z

.field private static final RESTART_LOCALLY:Z

.field private static wrongTokenCount:I


# instance fields
.field private final context:Landroid/content/Context;

.field private serverSocket:Landroid/net/LocalServerSocket;


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x2

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p2, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    .line 91
    :try_start_0
    new-instance v1, Landroid/net/LocalServerSocket;

    invoke-direct {v1, p1}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 92
    const-string/jumbo v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Starting server socket listening for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 94
    invoke-virtual {v3}, Landroid/net/LocalServerSocket;->getLocalSocketAddress()Landroid/net/LocalSocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :cond_0
    invoke-direct {p0}, Lcom/android/tools/fd/runtime/Server;->startServer()V

    .line 102
    const-string/jumbo v1, "InstantRun"

    invoke-static {v1, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 103
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Started server for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_1
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "IO Error creating local socket at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/android/tools/fd/runtime/Server;)Landroid/net/LocalServerSocket;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 58
    sget v0, Lcom/android/tools/fd/runtime/Server;->wrongTokenCount:I

    return v0
.end method

.method static synthetic access$208()I
    .locals 2

    .prologue
    .line 58
    sget v0, Lcom/android/tools/fd/runtime/Server;->wrongTokenCount:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/android/tools/fd/runtime/Server;->wrongTokenCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Ljava/util/List;)Z
    .locals 1
    .param p0, "x0"    # Ljava/util/List;

    .prologue
    .line 58
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Server;->hasResources(Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/android/tools/fd/runtime/Server;Ljava/util/List;ZI)I
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z
    .param p3, "x3"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/fd/runtime/Server;->handlePatches(Ljava/util/List;ZI)I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/android/tools/fd/runtime/Server;IZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/android/tools/fd/runtime/Server;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/fd/runtime/Server;->restart(IZZ)V

    return-void
.end method

.method public static create(Landroid/content/Context;)Lcom/android/tools/fd/runtime/Server;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 85
    new-instance v0, Lcom/android/tools/fd/runtime/Server;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/android/tools/fd/runtime/Server;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method

.method private handleHotSwapPatch(ILcom/android/tools/fd/runtime/ApplicationPatch;)I
    .locals 15
    .param p1, "updateMode"    # I
    .param p2, "patch"    # Lcom/android/tools/fd/runtime/ApplicationPatch;

    .prologue
    .line 428
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 429
    const-string/jumbo v10, "InstantRun"

    const-string/jumbo v11, "Received incremental code patch"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    :cond_0
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v10

    invoke-static {v10}, Lcom/android/tools/fd/runtime/FileManager;->writeTempDexFile([B)Ljava/lang/String;

    move-result-object v3

    .line 433
    .local v3, "dexFile":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 434
    const-string/jumbo v10, "InstantRun"

    const-string/jumbo v11, "No file to write the code to"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v9, p1

    .line 476
    .end local v3    # "dexFile":Ljava/lang/String;
    .end local p1    # "updateMode":I
    .local v9, "updateMode":I
    :goto_0
    return v9

    .line 436
    .end local v9    # "updateMode":I
    .restart local v3    # "dexFile":Ljava/lang/String;
    .restart local p1    # "updateMode":I
    :cond_1
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 437
    const-string/jumbo v10, "InstantRun"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Reading live code from "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    :cond_2
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getNativeLibraryFolder()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 440
    .local v8, "nativeLibraryPath":Ljava/lang/String;
    new-instance v2, Ldalvik/system/DexClassLoader;

    iget-object v10, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    .line 441
    invoke-virtual {v10}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    .line 442
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-direct {v2, v3, v10, v8, v11}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 445
    .local v2, "dexClassLoader":Ldalvik/system/DexClassLoader;
    const-string/jumbo v10, "com.android.tools.fd.runtime.AppPatchesLoaderImpl"

    const/4 v11, 0x1

    invoke-static {v10, v11, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 448
    .local v1, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 449
    const-string/jumbo v10, "InstantRun"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Got the patcher class "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/tools/fd/runtime/PatchesLoader;

    .line 453
    .local v7, "loader":Lcom/android/tools/fd/runtime/PatchesLoader;
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 454
    const-string/jumbo v10, "InstantRun"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Got the patcher instance "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    :cond_4
    const-string/jumbo v10, "getPatchedClasses"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    .line 457
    invoke-virtual {v1, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v10, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    move-object v0, v10

    check-cast v0, [Ljava/lang/String;

    move-object v6, v0

    .line 458
    .local v6, "getPatchedClasses":[Ljava/lang/String;
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 459
    const-string/jumbo v10, "InstantRun"

    const-string/jumbo v11, "Got the list of classes "

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    array-length v11, v6

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v11, :cond_5

    aget-object v5, v6, v10

    .line 461
    .local v5, "getPatchedClass":Ljava/lang/String;
    const-string/jumbo v12, "InstantRun"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "class "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 464
    .end local v5    # "getPatchedClass":Ljava/lang/String;
    :cond_5
    invoke-interface {v7}, Lcom/android/tools/fd/runtime/PatchesLoader;->load()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v10

    if-nez v10, :cond_6

    .line 465
    const/16 p1, 0x3

    .end local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .end local v3    # "dexFile":Ljava/lang/String;
    .end local v6    # "getPatchedClasses":[Ljava/lang/String;
    .end local v7    # "loader":Lcom/android/tools/fd/runtime/PatchesLoader;
    .end local v8    # "nativeLibraryPath":Ljava/lang/String;
    :cond_6
    :goto_2
    move/from16 v9, p1

    .line 476
    .end local p1    # "updateMode":I
    .restart local v9    # "updateMode":I
    goto/16 :goto_0

    .line 467
    .end local v9    # "updateMode":I
    .restart local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .restart local v3    # "dexFile":Ljava/lang/String;
    .restart local v8    # "nativeLibraryPath":Ljava/lang/String;
    .restart local p1    # "updateMode":I
    :catch_0
    move-exception v4

    .line 468
    .local v4, "e":Ljava/lang/Exception;
    :try_start_2
    const-string/jumbo v10, "InstantRun"

    const-string/jumbo v11, "Couldn\'t apply code changes"

    invoke-static {v10, v11, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 469
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 470
    const/16 p1, 0x3

    goto :goto_2

    .line 472
    .end local v1    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .end local v3    # "dexFile":Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v8    # "nativeLibraryPath":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 473
    .local v4, "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "InstantRun"

    const-string/jumbo v11, "Couldn\'t apply code changes"

    invoke-static {v10, v11, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 474
    const/16 p1, 0x3

    goto :goto_2
.end method

.method private handlePatches(Ljava/util/List;ZI)I
    .locals 4
    .param p2, "hasResources"    # Z
    .param p3, "updateMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/tools/fd/runtime/ApplicationPatch;",
            ">;ZI)I"
        }
    .end annotation

    .prologue
    .line 396
    .local p1, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    if-eqz p2, :cond_0

    .line 397
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->startUpdate()V

    .line 400
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/tools/fd/runtime/ApplicationPatch;

    .line 401
    .local v0, "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 402
    .local v1, "path":Ljava/lang/String;
    const-string/jumbo v3, "classes.dex.3"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 403
    invoke-direct {p0, p3, v0}, Lcom/android/tools/fd/runtime/Server;->handleHotSwapPatch(ILcom/android/tools/fd/runtime/ApplicationPatch;)I

    move-result p3

    goto :goto_0

    .line 404
    :cond_2
    invoke-static {v1}, Lcom/android/tools/fd/runtime/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 405
    invoke-static {p3, v0, v1}, Lcom/android/tools/fd/runtime/Server;->handleResourcePatch(ILcom/android/tools/fd/runtime/ApplicationPatch;Ljava/lang/String;)I

    move-result p3

    goto :goto_0

    .line 409
    .end local v0    # "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    .end local v1    # "path":Ljava/lang/String;
    :cond_3
    if-eqz p2, :cond_4

    .line 410
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/android/tools/fd/runtime/FileManager;->finishUpdate(Z)V

    .line 413
    :cond_4
    return p3
.end method

.method private static handleResourcePatch(ILcom/android/tools/fd/runtime/ApplicationPatch;Ljava/lang/String;)I
    .locals 4
    .param p0, "updateMode"    # I
    .param p1, "patch"    # Lcom/android/tools/fd/runtime/ApplicationPatch;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    .line 418
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Received resource changes ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    :cond_0
    invoke-virtual {p1}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/tools/fd/runtime/FileManager;->writeAaptResources(Ljava/lang/String;[B)V

    .line 423
    invoke-static {p0, v3}, Ljava/lang/Math;->max(II)I

    move-result p0

    .line 424
    return p0
.end method

.method private static hasResources(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/tools/fd/runtime/ApplicationPatch;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 384
    .local p0, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/tools/fd/runtime/ApplicationPatch;

    .line 385
    .local v0, "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 386
    .local v1, "path":Ljava/lang/String;
    invoke-static {v1}, Lcom/android/tools/fd/runtime/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 387
    const/4 v2, 0x1

    .line 391
    .end local v0    # "change":Lcom/android/tools/fd/runtime/ApplicationPatch;
    .end local v1    # "path":Ljava/lang/String;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isResourcePath(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 378
    const-string/jumbo v0, "resources.ap_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "res/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private restart(IZZ)V
    .locals 13
    .param p1, "updateMode"    # I
    .param p2, "incrementalResources"    # Z
    .param p3, "toast"    # Z

    .prologue
    .line 480
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 481
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Finished loading changes; update mode ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    :cond_0
    if-eqz p1, :cond_1

    const/4 v8, 0x1

    if-ne p1, v8, :cond_5

    .line 485
    :cond_1
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 486
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Applying incremental code without restart"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    :cond_2
    if-eqz p3, :cond_3

    .line 490
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    .line 491
    .local v3, "foreground":Landroid/app/Activity;
    if-eqz v3, :cond_4

    .line 492
    const-string/jumbo v8, "Applied code changes without activity restart"

    invoke-static {v3, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 581
    .end local v3    # "foreground":Landroid/app/Activity;
    :cond_3
    :goto_0
    return-void

    .line 494
    .restart local v3    # "foreground":Landroid/app/Activity;
    :cond_4
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 495
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Couldn\'t show toast: no activity found"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 501
    .end local v3    # "foreground":Landroid/app/Activity;
    :cond_5
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/android/tools/fd/runtime/Restarter;->getActivities(Landroid/content/Context;Z)Ljava/util/List;

    move-result-object v0

    .line 503
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    if-eqz p2, :cond_7

    const/4 v8, 0x2

    if-ne p1, v8, :cond_7

    .line 505
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v2

    .line 507
    .local v2, "file":Ljava/io/File;
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 508
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "About to update resource file="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ", activities="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    :cond_6
    if-eqz v2, :cond_c

    .line 513
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 514
    .local v6, "resources":Ljava/lang/String;
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    invoke-static {v8, v6, v0}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V

    .line 521
    .end local v2    # "file":Ljava/io/File;
    .end local v6    # "resources":Ljava/lang/String;
    :cond_7
    :goto_1
    iget-object v8, p0, Lcom/android/tools/fd/runtime/Server;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    .line 522
    .local v1, "activity":Landroid/app/Activity;
    const/4 v8, 0x2

    if-ne p1, v8, :cond_f

    .line 523
    if-eqz v1, :cond_d

    .line 524
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 525
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Restarting activity only!"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    :cond_8
    const/4 v4, 0x0

    .line 533
    .local v4, "handledRestart":Z
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string/jumbo v9, "onHandleCodeChange"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v12, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v12, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 534
    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v5, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 535
    .local v7, "result":Ljava/lang/Object;
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 536
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Activity "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " provided manual restart method; return "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    :cond_9
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 540
    const/4 v4, 0x1

    .line 541
    if-eqz p3, :cond_a

    .line 542
    const-string/jumbo v8, "Applied changes"

    invoke-static {v1, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 548
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "result":Ljava/lang/Object;
    :cond_a
    :goto_2
    if-nez v4, :cond_3

    .line 549
    if-eqz p3, :cond_b

    .line 550
    const-string/jumbo v8, "Applied changes, restarted activity"

    invoke-static {v1, v8}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 552
    :cond_b
    invoke-static {v1}, Lcom/android/tools/fd/runtime/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    goto/16 :goto_0

    .line 516
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v4    # "handledRestart":Z
    .restart local v2    # "file":Ljava/io/File;
    :cond_c
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "No resource file found to apply"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    const/4 p1, 0x3

    goto/16 :goto_1

    .line 557
    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "activity":Landroid/app/Activity;
    :cond_d
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 558
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "No activity found, falling through to do a full app restart"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    :cond_e
    const/4 p1, 0x3

    .line 563
    :cond_f
    const/4 v8, 0x3

    if-eq p1, v8, :cond_10

    .line 564
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x6

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 565
    const-string/jumbo v8, "InstantRun"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Unexpected update mode: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 577
    :cond_10
    const-string/jumbo v8, "InstantRun"

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 578
    const-string/jumbo v8, "InstantRun"

    const-string/jumbo v9, "Waiting for app to be killed and restarted by the IDE..."

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 545
    .restart local v4    # "handledRestart":Z
    :catch_0
    move-exception v8

    goto :goto_2
.end method

.method private startServer()V
    .locals 4

    .prologue
    .line 109
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/android/tools/fd/runtime/Server$SocketServerThread;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/tools/fd/runtime/Server$SocketServerThread;-><init>(Lcom/android/tools/fd/runtime/Server;Lcom/android/tools/fd/runtime/Server$1;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 110
    .local v1, "socketServerThread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .end local v1    # "socketServerThread":Ljava/lang/Thread;
    :cond_0
    :goto_0
    return-void

    .line 111
    :catch_0
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "InstantRun"

    const/4 v3, 0x6

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 115
    const-string/jumbo v2, "InstantRun"

    const-string/jumbo v3, "Fatal error starting Instant Run server"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public shutdown()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    if-eqz v0, :cond_0

    .line 123
    :try_start_0
    iget-object v0, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/tools/fd/runtime/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 128
    :cond_0
    return-void

    .line 124
    :catch_0
    move-exception v0

    goto :goto_0
.end method
