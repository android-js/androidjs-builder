.class public abstract Lcom/android/tools/fd/runtime/AbstractPatchesLoaderImpl;
.super Ljava/lang/Object;
.source "AbstractPatchesLoaderImpl.java"

# interfaces
.implements Lcom/android/tools/fd/runtime/PatchesLoader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getPatchedClasses()[Ljava/lang/String;
.end method

.method public load()Z
    .locals 17

    .prologue
    .line 32
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/tools/fd/runtime/AbstractPatchesLoaderImpl;->getPatchedClasses()[Ljava/lang/String;

    move-result-object v10

    array-length v11, v10

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v11, :cond_3

    aget-object v3, v10, v9

    .line 33
    .local v3, "className":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 34
    .local v2, "cl":Ljava/lang/ClassLoader;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "$override"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 35
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    .line 36
    .local v6, "o":Ljava/lang/Object;
    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 37
    .local v7, "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v12, "$change"

    invoke-virtual {v7, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 40
    .local v1, "changeField":Ljava/lang/reflect/Field;
    const/4 v12, 0x1

    invoke-virtual {v1, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 43
    const/4 v12, 0x0

    invoke-virtual {v1, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 44
    .local v8, "previous":Ljava/lang/Object;
    if-eqz v8, :cond_0

    .line 45
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    const-string/jumbo v13, "$obsolete"

    invoke-virtual {v12, v13}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 46
    .local v5, "isObsolete":Ljava/lang/reflect/Field;
    if-eqz v5, :cond_0

    .line 47
    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v5, v12, v13}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .end local v5    # "isObsolete":Ljava/lang/reflect/Field;
    :cond_0
    const/4 v12, 0x0

    invoke-virtual {v1, v12, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    sget-object v12, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v12, :cond_1

    sget-object v12, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v12, v13}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 53
    sget-object v12, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v14, "patched %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v3, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 56
    .end local v0    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "changeField":Ljava/lang/reflect/Field;
    .end local v2    # "cl":Ljava/lang/ClassLoader;
    .end local v3    # "className":Ljava/lang/String;
    .end local v6    # "o":Ljava/lang/Object;
    .end local v7    # "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "previous":Ljava/lang/Object;
    :catch_0
    move-exception v4

    .line 57
    .local v4, "e":Ljava/lang/Exception;
    sget-object v9, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v9, :cond_2

    .line 58
    sget-object v9, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v10, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v11, "Exception while patching %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string/jumbo v14, "foo.bar"

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11, v4}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    :cond_2
    const/4 v9, 0x0

    .line 62
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_1
    return v9

    :cond_3
    const/4 v9, 0x1

    goto :goto_1
.end method
