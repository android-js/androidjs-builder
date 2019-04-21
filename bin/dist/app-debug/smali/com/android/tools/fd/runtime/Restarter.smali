.class public Lcom/android/tools/fd/runtime/Restarter;
.super Ljava/lang/Object;
.source "Restarter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/Activity;

    .prologue
    .line 54
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Restarter;->updateActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public static getActivities(Landroid/content/Context;Z)Ljava/util/List;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "foregroundOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 186
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .local v11, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    :try_start_0
    const-string/jumbo v13, "android.app.ActivityThread"

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 189
    .local v8, "activityThreadClass":Ljava/lang/Class;
    invoke-static {p0, v8}, Lcom/android/tools/fd/runtime/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 190
    .local v7, "activityThread":Ljava/lang/Object;
    const-string/jumbo v13, "mActivities"

    invoke-virtual {v8, v13}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 191
    .local v2, "activitiesField":Ljava/lang/reflect/Field;
    const/4 v13, 0x1

    invoke-virtual {v2, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 194
    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 196
    .local v10, "collection":Ljava/lang/Object;
    instance-of v13, v10, Ljava/util/HashMap;

    if-eqz v13, :cond_3

    .line 198
    move-object v0, v10

    check-cast v0, Ljava/util/HashMap;

    move-object v1, v0

    .line 199
    .local v1, "activities":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    .line 207
    .end local v1    # "activities":Ljava/util/Map;
    .local v9, "c":Ljava/util/Collection;
    :goto_0
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_0
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 208
    .local v5, "activityRecord":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 209
    .local v6, "activityRecordClass":Ljava/lang/Class;
    if-eqz p1, :cond_1

    .line 210
    const-string/jumbo v14, "paused"

    invoke-virtual {v6, v14}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    .line 211
    .local v12, "pausedField":Ljava/lang/reflect/Field;
    const/4 v14, 0x1

    invoke-virtual {v12, v14}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 212
    invoke-virtual {v12, v5}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 216
    .end local v12    # "pausedField":Ljava/lang/reflect/Field;
    :cond_1
    const-string/jumbo v14, "activity"

    invoke-virtual {v6, v14}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 217
    .local v4, "activityField":Ljava/lang/reflect/Field;
    const/4 v14, 0x1

    invoke-virtual {v4, v14}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 218
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 219
    .local v3, "activity":Landroid/app/Activity;
    if-eqz v3, :cond_0

    .line 220
    invoke-interface {v11, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 223
    .end local v2    # "activitiesField":Ljava/lang/reflect/Field;
    .end local v3    # "activity":Landroid/app/Activity;
    .end local v4    # "activityField":Ljava/lang/reflect/Field;
    .end local v5    # "activityRecord":Ljava/lang/Object;
    .end local v6    # "activityRecordClass":Ljava/lang/Class;
    .end local v7    # "activityThread":Ljava/lang/Object;
    .end local v8    # "activityThreadClass":Ljava/lang/Class;
    .end local v9    # "c":Ljava/util/Collection;
    .end local v10    # "collection":Ljava/lang/Object;
    :catch_0
    move-exception v13

    .line 225
    :cond_2
    return-object v11

    .line 200
    .restart local v2    # "activitiesField":Ljava/lang/reflect/Field;
    .restart local v7    # "activityThread":Ljava/lang/Object;
    .restart local v8    # "activityThreadClass":Ljava/lang/Class;
    .restart local v10    # "collection":Ljava/lang/Object;
    :cond_3
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x13

    if-lt v13, v14, :cond_2

    instance-of v13, v10, Landroid/util/ArrayMap;

    if-eqz v13, :cond_2

    .line 202
    move-object v0, v10

    check-cast v0, Landroid/util/ArrayMap;

    move-object v1, v0

    .line 203
    .local v1, "activities":Landroid/util/ArrayMap;
    invoke-virtual {v1}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 204
    .restart local v9    # "c":Ljava/util/Collection;
    goto :goto_0
.end method

.method public static getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 179
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/android/tools/fd/runtime/Restarter;->getActivities(Landroid/content/Context;Z)Ljava/util/List;

    move-result-object v0

    .line 180
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    goto :goto_0
.end method

.method private static restartActivity(Landroid/app/Activity;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x2

    .line 69
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "About to restart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 75
    const-string/jumbo v0, "InstantRun"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is not a top level activity; restarting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 78
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " instead"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object p0

    goto :goto_0

    .line 84
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    .line 85
    return-void
.end method

.method public static restartActivityOnUiThread(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 57
    new-instance v0, Lcom/android/tools/fd/runtime/Restarter$1;

    invoke-direct {v0, p0}, Lcom/android/tools/fd/runtime/Restarter$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 66
    return-void
.end method

.method public static restartApp(Landroid/content/Context;Ljava/util/Collection;Z)V
    .locals 13
    .param p0, "appContext"    # Landroid/content/Context;
    .param p2, "toast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<",
            "Landroid/app/Activity;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "knownActivities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    const/4 v12, 0x2

    .line 103
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    .line 105
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    .line 107
    .local v1, "foreground":Landroid/app/Activity;
    if-eqz v1, :cond_4

    .line 110
    if-eqz p2, :cond_0

    .line 111
    const-string/jumbo v6, "Restarting app to apply incompatible changes"

    invoke-static {v1, v6}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 113
    :cond_0
    const-string/jumbo v6, "InstantRun"

    invoke-static {v6, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 114
    const-string/jumbo v6, "InstantRun"

    const-string/jumbo v7, "RESTARTING APP"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    :cond_1
    move-object v0, v1

    .line 118
    .local v0, "context":Landroid/content/Context;
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {v2, v0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 119
    .local v2, "intent":Landroid/content/Intent;
    const/4 v3, 0x0

    .line 120
    .local v3, "intentId":I
    const/high16 v6, 0x10000000

    invoke-static {v0, v3, v2, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 122
    .local v5, "pendingIntent":Landroid/app/PendingIntent;
    const-string/jumbo v6, "alarm"

    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AlarmManager;

    .line 123
    .local v4, "mgr":Landroid/app/AlarmManager;
    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x64

    add-long/2addr v8, v10

    invoke-virtual {v4, v6, v8, v9, v5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 124
    const-string/jumbo v6, "InstantRun"

    invoke-static {v6, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 125
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Scheduling activity "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " to start after exiting process"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .end local v0    # "context":Landroid/content/Context;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "intentId":I
    .end local v4    # "mgr":Landroid/app/AlarmManager;
    .end local v5    # "pendingIntent":Landroid/app/PendingIntent;
    :cond_2
    :goto_0
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    .line 137
    .end local v1    # "foreground":Landroid/app/Activity;
    :cond_3
    return-void

    .line 129
    .restart local v1    # "foreground":Landroid/app/Activity;
    :cond_4
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/Activity;

    const-string/jumbo v7, "Unable to restart app"

    invoke-static {v6, v7}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 130
    const-string/jumbo v6, "InstantRun"

    invoke-static {v6, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 131
    const-string/jumbo v6, "InstantRun"

    const-string/jumbo v7, "Couldn\'t find any foreground activities to restart for resource refresh"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static showToast(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 140
    const-string/jumbo v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "About to show toast for activity "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_0
    new-instance v0, Lcom/android/tools/fd/runtime/Restarter$2;

    invoke-direct {v0, p0, p1}, Lcom/android/tools/fd/runtime/Restarter$2;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 175
    return-void
.end method

.method private static updateActivity(Landroid/app/Activity;)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 268
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Restarter;->restartActivity(Landroid/app/Activity;)V

    .line 269
    return-void
.end method
