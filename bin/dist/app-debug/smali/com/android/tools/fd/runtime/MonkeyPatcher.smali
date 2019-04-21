.class public Lcom/android/tools/fd/runtime/MonkeyPatcher;
.super Ljava/lang/Object;
.source "MonkeyPatcher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 57
    if-nez p1, :cond_0

    .line 58
    :try_start_0
    const-string/jumbo v7, "android.app.ActivityThread"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 60
    :cond_0
    const-string/jumbo v7, "currentActivityThread"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {p1, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 61
    .local v3, "m":Ljava/lang/reflect/Method;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 62
    const/4 v7, 0x0

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 63
    .local v1, "currentActivityThread":Ljava/lang/Object;
    if-nez v1, :cond_1

    if-eqz p0, :cond_1

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mLoadedApk"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 68
    .local v5, "mLoadedApk":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 69
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 70
    .local v0, "apk":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mActivityThread"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 71
    .local v4, "mActivityThreadField":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 72
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 76
    .end local v0    # "apk":Ljava/lang/Object;
    .end local v1    # "currentActivityThread":Ljava/lang/Object;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v4    # "mActivityThreadField":Ljava/lang/reflect/Field;
    .end local v5    # "mLoadedApk":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    return-object v1

    .line 75
    :catch_0
    move-exception v2

    .local v2, "ignore":Ljava/lang/Throwable;
    move-object v1, v6

    .line 76
    goto :goto_0
.end method

.method public static monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 39
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "externalResourceFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p2, "activities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    if-nez p1, :cond_1

    .line 215
    :cond_0
    return-void

    .line 90
    :cond_1
    :try_start_0
    const-class v34, Landroid/content/res/AssetManager;

    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v35, v0

    invoke-virtual/range {v34 .. v35}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v34

    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    invoke-virtual/range {v34 .. v35}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Landroid/content/res/AssetManager;

    .line 91
    .local v24, "newAssetManager":Landroid/content/res/AssetManager;
    const-class v34, Landroid/content/res/AssetManager;

    const-string/jumbo v35, "addAssetPath"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const-class v38, Ljava/lang/String;

    aput-object v38, v36, v37

    invoke-virtual/range {v34 .. v36}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 92
    .local v12, "mAddAssetPath":Ljava/lang/reflect/Method;
    const/16 v34, 0x1

    move/from16 v0, v34

    invoke-virtual {v12, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 93
    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object p1, v34, v35

    move-object/from16 v0, v24

    move-object/from16 v1, v34

    invoke-virtual {v12, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/Integer;

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v34

    if-nez v34, :cond_2

    .line 94
    new-instance v34, Ljava/lang/IllegalStateException;

    const-string/jumbo v35, "Could not create new AssetManager"

    invoke-direct/range {v34 .. v35}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v34
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .end local v12    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .end local v24    # "newAssetManager":Landroid/content/res/AssetManager;
    :catch_0
    move-exception v6

    .line 213
    .local v6, "e":Ljava/lang/Throwable;
    new-instance v34, Ljava/lang/IllegalStateException;

    move-object/from16 v0, v34

    invoke-direct {v0, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v34

    .line 99
    .end local v6    # "e":Ljava/lang/Throwable;
    .restart local v12    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .restart local v24    # "newAssetManager":Landroid/content/res/AssetManager;
    :cond_2
    :try_start_1
    const-class v34, Landroid/content/res/AssetManager;

    const-string/jumbo v35, "ensureStringBlocks"

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v36, v0

    invoke-virtual/range {v34 .. v36}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    .line 100
    .local v15, "mEnsureStringBlocks":Ljava/lang/reflect/Method;
    const/16 v34, 0x1

    move/from16 v0, v34

    invoke-virtual {v15, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 101
    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v34

    invoke-virtual {v15, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    if-eqz p2, :cond_4

    .line 104
    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v34

    :goto_0
    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_4

    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 105
    .local v3, "activity":Landroid/app/Activity;
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v27

    .line 108
    .local v27, "resources":Landroid/content/res/Resources;
    :try_start_2
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 109
    .local v13, "mAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 110
    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 120
    .end local v13    # "mAssets":Ljava/lang/reflect/Field;
    :goto_1
    :try_start_3
    invoke-virtual {v3}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v30

    .line 123
    .local v30, "theme":Landroid/content/res/Resources$Theme;
    :try_start_4
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v20

    .line 124
    .local v20, "ma":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 125
    move-object/from16 v0, v20

    move-object/from16 v1, v30

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    .line 135
    :goto_2
    :try_start_5
    const-class v35, Landroid/view/ContextThemeWrapper;

    const-string/jumbo v36, "mTheme"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v22

    .line 136
    .local v22, "mt":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 137
    const/16 v35, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    const-class v35, Landroid/view/ContextThemeWrapper;

    const-string/jumbo v36, "initializeTheme"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v23

    .line 139
    .local v23, "mtm":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 140
    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget v35, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v36, 0x18

    move/from16 v0, v35

    move/from16 v1, v36

    if-ge v0, v1, :cond_3

    .line 144
    const-class v35, Landroid/content/res/AssetManager;

    const-string/jumbo v36, "createTheme"

    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v37, v0

    .line 145
    invoke-virtual/range {v35 .. v37}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14

    .line 146
    .local v14, "mCreateTheme":Ljava/lang/reflect/Method;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 147
    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 148
    .local v11, "internalTheme":Ljava/lang/Object;
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mTheme"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v19

    .line 149
    .local v19, "mTheme":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 150
    move-object/from16 v0, v19

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v11}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 157
    .end local v11    # "internalTheme":Ljava/lang/Object;
    .end local v14    # "mCreateTheme":Ljava/lang/reflect/Method;
    .end local v19    # "mTheme":Ljava/lang/reflect/Field;
    .end local v20    # "ma":Ljava/lang/reflect/Field;
    .end local v22    # "mt":Ljava/lang/reflect/Field;
    .end local v23    # "mtm":Ljava/lang/reflect/Method;
    :cond_3
    :goto_3
    :try_start_6
    invoke-static/range {v27 .. v27}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCaches(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 111
    .end local v30    # "theme":Landroid/content/res/Resources$Theme;
    :catch_1
    move-exception v8

    .line 112
    .local v8, "ignore":Ljava/lang/Throwable;
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mResourcesImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v18

    .line 113
    .local v18, "mResourcesImpl":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 114
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .line 115
    .local v26, "resourceImpl":Ljava/lang/Object;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 116
    .local v10, "implAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 117
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v10, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_1

    .line 126
    .end local v8    # "ignore":Ljava/lang/Throwable;
    .end local v10    # "implAssets":Ljava/lang/reflect/Field;
    .end local v18    # "mResourcesImpl":Ljava/lang/reflect/Field;
    .end local v26    # "resourceImpl":Ljava/lang/Object;
    .restart local v30    # "theme":Landroid/content/res/Resources$Theme;
    :catch_2
    move-exception v8

    .line 127
    .local v8, "ignore":Ljava/lang/NoSuchFieldException;
    :try_start_7
    const-class v35, Landroid/content/res/Resources$Theme;

    const-string/jumbo v36, "mThemeImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v31

    .line 128
    .local v31, "themeField":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v31

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 129
    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 130
    .local v9, "impl":Ljava/lang/Object;
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v20

    .line 131
    .restart local v20    # "ma":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 132
    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v9, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    goto/16 :goto_2

    .line 152
    .end local v8    # "ignore":Ljava/lang/NoSuchFieldException;
    .end local v9    # "impl":Ljava/lang/Object;
    .end local v20    # "ma":Ljava/lang/reflect/Field;
    .end local v31    # "themeField":Ljava/lang/reflect/Field;
    :catch_3
    move-exception v6

    .line 153
    .restart local v6    # "e":Ljava/lang/Throwable;
    :try_start_8
    const-string/jumbo v35, "InstantRun"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v37, "Failed to update existing theme for activity "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3

    .line 163
    .end local v3    # "activity":Landroid/app/Activity;
    .end local v6    # "e":Ljava/lang/Throwable;
    .end local v27    # "resources":Landroid/content/res/Resources;
    .end local v30    # "theme":Landroid/content/res/Resources$Theme;
    :cond_4
    sget v34, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v35, 0x13

    move/from16 v0, v34

    move/from16 v1, v35

    if-lt v0, v1, :cond_6

    .line 165
    const-string/jumbo v34, "android.app.ResourcesManager"

    invoke-static/range {v34 .. v34}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v29

    .line 166
    .local v29, "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v34, "getInstance"

    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v35, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v16

    .line 167
    .local v16, "mGetInstance":Ljava/lang/reflect/Method;
    const/16 v34, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 168
    const/16 v34, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    move-result-object v28

    .line 170
    .local v28, "resourcesManager":Ljava/lang/Object;
    :try_start_9
    const-string/jumbo v34, "mActiveResources"

    move-object/from16 v0, v29

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 171
    .local v7, "fMActiveResources":Ljava/lang/reflect/Field;
    const/16 v34, 0x1

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 174
    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/ArrayMap;

    .line 175
    .local v5, "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual {v5}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;
    :try_end_9
    .catch Ljava/lang/NoSuchFieldException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0

    move-result-object v25

    .line 192
    .end local v5    # "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    .end local v16    # "mGetInstance":Ljava/lang/reflect/Method;
    .end local v28    # "resourcesManager":Ljava/lang/Object;
    .end local v29    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v25, "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :goto_4
    :try_start_a
    invoke-interface/range {v25 .. v25}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v34

    :cond_5
    :goto_5
    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_0

    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/lang/ref/WeakReference;

    .line 193
    .local v33, "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    invoke-virtual/range {v33 .. v33}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Landroid/content/res/Resources;
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_0

    .line 194
    .restart local v27    # "resources":Landroid/content/res/Resources;
    if-eqz v27, :cond_5

    .line 197
    :try_start_b
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 198
    .restart local v13    # "mAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 199
    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_5

    .line 209
    .end local v13    # "mAssets":Ljava/lang/reflect/Field;
    :goto_6
    :try_start_c
    invoke-virtual/range {v27 .. v27}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v35

    invoke-virtual/range {v27 .. v27}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v36

    move-object/from16 v0, v27

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    goto :goto_5

    .line 176
    .end local v25    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v27    # "resources":Landroid/content/res/Resources;
    .end local v33    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    .restart local v16    # "mGetInstance":Ljava/lang/reflect/Method;
    .restart local v28    # "resourcesManager":Ljava/lang/Object;
    .restart local v29    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_4
    move-exception v8

    .line 177
    .restart local v8    # "ignore":Ljava/lang/NoSuchFieldException;
    const-string/jumbo v34, "mResourceReferences"

    move-object/from16 v0, v29

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v17

    .line 178
    .local v17, "mResourceReferences":Ljava/lang/reflect/Field;
    const/16 v34, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 180
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/util/Collection;

    .restart local v25    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    goto :goto_4

    .line 183
    .end local v8    # "ignore":Ljava/lang/NoSuchFieldException;
    .end local v16    # "mGetInstance":Ljava/lang/reflect/Method;
    .end local v17    # "mResourceReferences":Ljava/lang/reflect/Field;
    .end local v25    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v28    # "resourcesManager":Ljava/lang/Object;
    .end local v29    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_6
    const-string/jumbo v34, "android.app.ActivityThread"

    invoke-static/range {v34 .. v34}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 184
    .local v4, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v34, "mActiveResources"

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 185
    .restart local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    const/16 v34, 0x1

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 186
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v32

    .line 189
    .local v32, "thread":Ljava/lang/Object;
    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/HashMap;

    .line 190
    .local v21, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v25

    .restart local v25    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    goto/16 :goto_4

    .line 200
    .end local v4    # "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "fMActiveResources":Ljava/lang/reflect/Field;
    .end local v21    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v32    # "thread":Ljava/lang/Object;
    .restart local v27    # "resources":Landroid/content/res/Resources;
    .restart local v33    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catch_5
    move-exception v8

    .line 201
    .local v8, "ignore":Ljava/lang/Throwable;
    const-class v35, Landroid/content/res/Resources;

    const-string/jumbo v36, "mResourcesImpl"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v18

    .line 202
    .restart local v18    # "mResourcesImpl":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 203
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .line 204
    .restart local v26    # "resourceImpl":Ljava/lang/Object;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v35

    const-string/jumbo v36, "mAssets"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 205
    .restart local v10    # "implAssets":Ljava/lang/reflect/Field;
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 206
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v10, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_0

    goto/16 :goto_6
.end method

.method private static pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 17
    .param p0, "resources"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 293
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v10

    .line 296
    .local v10, "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v4

    .line 300
    .local v4, "cacheField":Ljava/lang/reflect/Field;
    :goto_0
    const/4 v12, 0x1

    :try_start_2
    invoke-virtual {v4, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 301
    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 304
    .local v3, "cache":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    .line 305
    .local v11, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x10

    if-ge v12, v13, :cond_1

    .line 306
    instance-of v12, v3, Landroid/util/SparseArray;

    if-eqz v12, :cond_0

    .line 307
    check-cast v3, Landroid/util/SparseArray;

    .end local v3    # "cache":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 308
    const/4 v12, 0x1

    .line 380
    .end local v4    # "cacheField":Ljava/lang/reflect/Field;
    .end local v10    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    return v12

    .line 297
    .restart local v10    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v9

    .line 298
    .local v9, "ignore":Ljava/lang/NoSuchFieldException;
    const-class v12, Landroid/content/res/Resources;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .restart local v4    # "cacheField":Ljava/lang/reflect/Field;
    goto :goto_0

    .line 309
    .end local v9    # "ignore":Ljava/lang/NoSuchFieldException;
    .restart local v3    # "cache":Ljava/lang/Object;
    .restart local v11    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0xe

    if-lt v12, v13, :cond_2

    instance-of v12, v3, Landroid/util/LongSparseArray;

    if-eqz v12, :cond_2

    .line 313
    check-cast v3, Landroid/util/LongSparseArray;

    .end local v3    # "cache":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/util/LongSparseArray;->clear()V

    .line 314
    const/4 v12, 0x1

    goto :goto_1

    .line 316
    .restart local v3    # "cache":Ljava/lang/Object;
    :cond_1
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x17

    if-ge v12, v13, :cond_8

    .line 318
    const-string/jumbo v12, "mColorStateListCache"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 321
    instance-of v12, v3, Landroid/util/LongSparseArray;

    if-eqz v12, :cond_2

    .line 323
    check-cast v3, Landroid/util/LongSparseArray;

    .end local v3    # "cache":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/util/LongSparseArray;->clear()V

    .line 380
    .end local v4    # "cacheField":Ljava/lang/reflect/Field;
    .end local v10    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_2
    const/4 v12, 0x0

    goto :goto_1

    .line 325
    .restart local v3    # "cache":Ljava/lang/Object;
    .restart local v4    # "cacheField":Ljava/lang/reflect/Field;
    .restart local v10    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v11    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    const-class v12, Landroid/util/ArrayMap;

    invoke-virtual {v11, v12}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 326
    const-class v12, Landroid/content/res/Resources;

    const-string/jumbo v13, "clearDrawableCachesLocked"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Class;

    const/4 v15, 0x0

    const-class v16, Landroid/util/ArrayMap;

    aput-object v16, v14, v15

    const/4 v15, 0x1

    sget-object v16, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v16, v14, v15

    invoke-virtual {v12, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 328
    .local v5, "clearArrayMap":Ljava/lang/reflect/Method;
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 329
    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    const/4 v13, 0x1

    const/4 v14, -0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    move-object/from16 v0, p0

    invoke-virtual {v5, v0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    const/4 v12, 0x1

    goto :goto_1

    .line 331
    .end local v5    # "clearArrayMap":Ljava/lang/reflect/Method;
    :cond_4
    const-class v12, Landroid/util/LongSparseArray;

    invoke-virtual {v11, v12}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    move-result v12

    if-eqz v12, :cond_5

    .line 333
    :try_start_3
    const-class v12, Landroid/content/res/Resources;

    const-string/jumbo v13, "clearDrawableCachesLocked"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Class;

    const/4 v15, 0x0

    const-class v16, Landroid/util/LongSparseArray;

    aput-object v16, v14, v15

    const/4 v15, 0x1

    sget-object v16, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v16, v14, v15

    invoke-virtual {v12, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 335
    .local v6, "clearSparseMap":Ljava/lang/reflect/Method;
    const/4 v12, 0x1

    invoke-virtual {v6, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 336
    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    const/4 v13, 0x1

    const/4 v14, -0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    move-object/from16 v0, p0

    invoke-virtual {v6, v0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 337
    const/4 v12, 0x1

    goto/16 :goto_1

    .line 338
    .end local v6    # "clearSparseMap":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v8

    .line 339
    .local v8, "e":Ljava/lang/NoSuchMethodException;
    :try_start_4
    instance-of v12, v3, Landroid/util/LongSparseArray;

    if-eqz v12, :cond_2

    .line 341
    check-cast v3, Landroid/util/LongSparseArray;

    .end local v3    # "cache":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/util/LongSparseArray;->clear()V

    .line 342
    const/4 v12, 0x1

    goto/16 :goto_1

    .line 345
    .end local v8    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v3    # "cache":Ljava/lang/Object;
    :cond_5
    invoke-virtual {v11}, Ljava/lang/Class;->isArray()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 346
    invoke-virtual {v11}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v12

    const-class v13, Landroid/util/LongSparseArray;

    invoke-virtual {v12, v13}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 347
    check-cast v3, [Landroid/util/LongSparseArray;

    .end local v3    # "cache":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [Landroid/util/LongSparseArray;

    move-object v2, v0

    .line 348
    .local v2, "arrays":[Landroid/util/LongSparseArray;
    array-length v13, v2

    const/4 v12, 0x0

    :goto_3
    if-ge v12, v13, :cond_7

    aget-object v1, v2, v12

    .line 349
    .local v1, "array":Landroid/util/LongSparseArray;
    if-eqz v1, :cond_6

    .line 351
    invoke-virtual {v1}, Landroid/util/LongSparseArray;->clear()V

    .line 348
    :cond_6
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 354
    .end local v1    # "array":Landroid/util/LongSparseArray;
    :cond_7
    const/4 v12, 0x1

    goto/16 :goto_1

    .line 365
    .end local v2    # "arrays":[Landroid/util/LongSparseArray;
    .restart local v3    # "cache":Ljava/lang/Object;
    :catch_2
    move-exception v12

    .line 368
    invoke-virtual {v11}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v11

    .line 358
    :cond_8
    if-eqz v11, :cond_2

    .line 360
    :try_start_5
    const-string/jumbo v12, "onConfigurationChange"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v15, v13, v14

    invoke-virtual {v11, v12, v13}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 362
    .local v7, "configChangeMethod":Ljava/lang/reflect/Method;
    const/4 v12, 0x1

    invoke-virtual {v7, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 363
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const/4 v14, -0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v7, v3, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2

    .line 364
    const/4 v12, 0x1

    goto/16 :goto_1

    .line 371
    .end local v3    # "cache":Ljava/lang/Object;
    .end local v4    # "cacheField":Ljava/lang/reflect/Field;
    .end local v7    # "configChangeMethod":Ljava/lang/reflect/Method;
    .end local v10    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_3
    move-exception v12

    goto/16 :goto_2
.end method

.method private static pruneResourceCaches(Ljava/lang/Object;)V
    .locals 11
    .param p0, "resources"    # Ljava/lang/Object;

    .prologue
    const/16 v10, 0x17

    .line 220
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-lt v8, v9, :cond_1

    .line 222
    :try_start_0
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mTypedArrayPool"

    .line 223
    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 224
    .local v7, "typedArrayPoolField":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 225
    invoke-virtual {v7, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 226
    .local v4, "pool":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 227
    .local v5, "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v8, "acquire"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 228
    .local v0, "acquireMethod":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 230
    :cond_0
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v6

    .line 231
    .local v6, "typedArray":Ljava/lang/Object;
    if-nez v6, :cond_0

    .line 239
    .end local v0    # "acquireMethod":Ljava/lang/reflect/Method;
    .end local v4    # "pool":Ljava/lang/Object;
    .end local v5    # "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "typedArray":Ljava/lang/Object;
    .end local v7    # "typedArrayPoolField":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v10, :cond_2

    .line 242
    :try_start_1
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mResourcesImpl"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 243
    .local v3, "mResourcesImpl":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 246
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object p0

    .line 252
    .end local v3    # "mResourcesImpl":Ljava/lang/reflect/Field;
    :cond_2
    :goto_1
    const/4 v2, 0x0

    .line 253
    .local v2, "lock":Ljava/lang/Object;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x12

    if-lt v8, v9, :cond_5

    .line 255
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string/jumbo v9, "mAccessLock"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 256
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 257
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v2

    .line 269
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "lock":Ljava/lang/Object;
    :goto_2
    if-nez v2, :cond_3

    .line 270
    const-class v2, Lcom/android/tools/fd/runtime/MonkeyPatcher;

    .line 274
    :cond_3
    monitor-enter v2

    .line 276
    :try_start_3
    const-string/jumbo v8, "mDrawableCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 277
    const-string/jumbo v8, "mColorDrawableCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 278
    const-string/jumbo v8, "mColorStateListCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 279
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v10, :cond_6

    .line 280
    const-string/jumbo v8, "mAnimatorCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 281
    const-string/jumbo v8, "mStateListAnimatorCache"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 287
    :cond_4
    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 288
    return-void

    .line 262
    .restart local v2    # "lock":Ljava/lang/Object;
    :cond_5
    :try_start_4
    const-class v8, Landroid/content/res/Resources;

    const-string/jumbo v9, "mTmpValue"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 263
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 264
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v2

    goto :goto_2

    .line 282
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "lock":Ljava/lang/Object;
    :cond_6
    :try_start_5
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x13

    if-ne v8, v9, :cond_4

    .line 283
    const-string/jumbo v8, "sPreloadedDrawables"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 284
    const-string/jumbo v8, "sPreloadedColorDrawables"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 285
    const-string/jumbo v8, "sPreloadedColorStateLists"

    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    goto :goto_3

    .line 287
    :catchall_0
    move-exception v8

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v8

    .line 265
    .restart local v2    # "lock":Ljava/lang/Object;
    :catch_0
    move-exception v8

    goto :goto_2

    .line 258
    :catch_1
    move-exception v8

    goto :goto_2

    .line 247
    .end local v2    # "lock":Ljava/lang/Object;
    :catch_2
    move-exception v8

    goto :goto_1

    .line 235
    :catch_3
    move-exception v8

    goto/16 :goto_0
.end method
