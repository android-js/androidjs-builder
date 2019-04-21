.class public Lcom/android/tools/fd/runtime/InstantRunService;
.super Landroid/app/Service;
.source "InstantRunService.java"


# instance fields
.field private server:Lcom/android/tools/fd/runtime/Server;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 46
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    .line 51
    const-string/jumbo v7, "InstantRun"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Starting Instant Run Server for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/android/tools/fd/runtime/InstantRunService;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 56
    sget-object v7, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    if-eqz v7, :cond_7

    .line 58
    const/4 v0, 0x0

    .line 59
    .local v0, "foundPackage":Z
    :try_start_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    .line 60
    .local v2, "pid":I
    const-string/jumbo v7, "activity"

    invoke-virtual {p0, v7}, Lcom/android/tools/fd/runtime/InstantRunService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 62
    .local v1, "manager":Landroid/app/ActivityManager;
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    .line 65
    .local v4, "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v4, :cond_4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_4

    .line 68
    const/4 v5, 0x0

    .line 69
    .local v5, "startServer":Z
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 70
    .local v3, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    sget-object v8, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    iget-object v9, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 71
    const/4 v0, 0x1

    .line 72
    iget v8, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v8, v2, :cond_0

    .line 73
    const/4 v5, 0x1

    .line 78
    .end local v3    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_1
    if-nez v5, :cond_2

    if-nez v0, :cond_2

    .line 82
    const/4 v5, 0x1

    .line 83
    const-string/jumbo v7, "InstantRun"

    const/4 v8, 0x2

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 84
    const-string/jumbo v7, "InstantRun"

    const-string/jumbo v8, "Multiprocess but didn\'t find process with package: starting server anyway"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_2
    :goto_0
    if-eqz v5, :cond_5

    .line 94
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Server;->create(Landroid/content/Context;)Lcom/android/tools/fd/runtime/Server;

    move-result-object v7

    iput-object v7, p0, Lcom/android/tools/fd/runtime/InstantRunService;->server:Lcom/android/tools/fd/runtime/Server;

    .line 109
    .end local v0    # "foundPackage":Z
    .end local v1    # "manager":Landroid/app/ActivityManager;
    .end local v2    # "pid":I
    .end local v4    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v5    # "startServer":Z
    :cond_3
    :goto_1
    return-void

    .line 90
    .restart local v0    # "foundPackage":Z
    .restart local v1    # "manager":Landroid/app/ActivityManager;
    .restart local v2    # "pid":I
    .restart local v4    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_4
    const/4 v5, 0x1

    .restart local v5    # "startServer":Z
    goto :goto_0

    .line 96
    :cond_5
    const-string/jumbo v7, "InstantRun"

    const/4 v8, 0x2

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 97
    const-string/jumbo v7, "InstantRun"

    const-string/jumbo v8, "In secondary process: Not starting server"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 100
    .end local v1    # "manager":Landroid/app/ActivityManager;
    .end local v2    # "pid":I
    .end local v4    # "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    .end local v5    # "startServer":Z
    :catch_0
    move-exception v6

    .line 101
    .local v6, "t":Ljava/lang/Throwable;
    const-string/jumbo v7, "InstantRun"

    invoke-static {v7, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 102
    const-string/jumbo v7, "InstantRun"

    const-string/jumbo v8, "Failed during multi process check"

    invoke-static {v7, v8, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    :cond_6
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Server;->create(Landroid/content/Context;)Lcom/android/tools/fd/runtime/Server;

    move-result-object v7

    iput-object v7, p0, Lcom/android/tools/fd/runtime/InstantRunService;->server:Lcom/android/tools/fd/runtime/Server;

    goto :goto_1

    .line 107
    .end local v0    # "foundPackage":Z
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_7
    invoke-static {p0}, Lcom/android/tools/fd/runtime/Server;->create(Landroid/content/Context;)Lcom/android/tools/fd/runtime/Server;

    move-result-object v7

    iput-object v7, p0, Lcom/android/tools/fd/runtime/InstantRunService;->server:Lcom/android/tools/fd/runtime/Server;

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/tools/fd/runtime/InstantRunService;->server:Lcom/android/tools/fd/runtime/Server;

    if-eqz v0, :cond_0

    .line 114
    const-string/jumbo v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Stopping Instant Run Server for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/tools/fd/runtime/InstantRunService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-object v0, p0, Lcom/android/tools/fd/runtime/InstantRunService;->server:Lcom/android/tools/fd/runtime/Server;

    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/Server;->shutdown()V

    .line 117
    :cond_0
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 118
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 40
    const/4 v0, 0x1

    return v0
.end method
