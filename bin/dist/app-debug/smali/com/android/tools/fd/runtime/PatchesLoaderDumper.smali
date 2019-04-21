.class public Lcom/android/tools/fd/runtime/PatchesLoaderDumper;
.super Ljava/lang/Object;
.source "PatchesLoaderDumper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 23
    :try_start_0
    const-string/jumbo v3, "com.android.tools.fd.runtime.AppPatchesLoaderImpl"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 24
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/tools/fd/runtime/PatchesLoader;

    .line 25
    .local v2, "patchesLoader":Lcom/android/tools/fd/runtime/PatchesLoader;
    invoke-interface {v2}, Lcom/android/tools/fd/runtime/PatchesLoader;->load()Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 33
    .end local v0    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "patchesLoader":Lcom/android/tools/fd/runtime/PatchesLoader;
    :goto_0
    return-void

    .line 26
    :catch_0
    move-exception v1

    .line 27
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 28
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 29
    .local v1, "e":Ljava/lang/InstantiationException;
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->printStackTrace()V

    goto :goto_0

    .line 30
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 31
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0
.end method
