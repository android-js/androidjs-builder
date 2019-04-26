.class public Lcom/android/js/JavaIPC;
.super Ljava/lang/Object;
.source "JavaIPC.java"


# instance fields
.field private activity:Lcom/android/js/MainActivity;

.field private call:Lcom/android/js/api/Call;

<<<<<<< HEAD
=======
.field private hotspot:Lcom/android/js/api/Hotspot;

>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
.field private myWebView:Landroid/webkit/WebView;

.field private notification:Lcom/android/js/api/Notification;

<<<<<<< HEAD
=======
.field private wifi:Lcom/android/js/api/Wifi;

>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b

# direct methods
.method public constructor <init>(Lcom/android/js/MainActivity;Landroid/webkit/WebView;)V
    .locals 1
    .param p1, "activity"    # Lcom/android/js/MainActivity;
    .param p2, "myWebView"    # Landroid/webkit/WebView;

    .prologue
<<<<<<< HEAD
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/android/js/JavaIPC;->activity:Lcom/android/js/MainActivity;

    .line 35
    iput-object p2, p0, Lcom/android/js/JavaIPC;->myWebView:Landroid/webkit/WebView;

    .line 36
=======
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/android/js/JavaIPC;->activity:Lcom/android/js/MainActivity;

    .line 44
    iput-object p2, p0, Lcom/android/js/JavaIPC;->myWebView:Landroid/webkit/WebView;

    .line 45
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    new-instance v0, Lcom/android/js/api/Notification;

    invoke-direct {v0, p1}, Lcom/android/js/api/Notification;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/js/JavaIPC;->notification:Lcom/android/js/api/Notification;

<<<<<<< HEAD
    .line 37
=======
    .line 46
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    new-instance v0, Lcom/android/js/api/Call;

    invoke-direct {v0, p1}, Lcom/android/js/api/Call;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/js/JavaIPC;->call:Lcom/android/js/api/Call;

<<<<<<< HEAD
    .line 38
=======
    .line 47
    new-instance v0, Lcom/android/js/api/Wifi;

    invoke-direct {v0, p1}, Lcom/android/js/api/Wifi;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    .line 48
    new-instance v0, Lcom/android/js/api/Hotspot;

    invoke-direct {v0, p1}, Lcom/android/js/api/Hotspot;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/js/JavaIPC;->hotspot:Lcom/android/js/api/Hotspot;

    .line 49
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method


# virtual methods
.method public connectWifi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "ssid"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0, p1, p2}, Lcom/android/js/api/Wifi;->connectWifi(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public disableHotspot()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/android/js/JavaIPC;->hotspot:Lcom/android/js/api/Hotspot;

    invoke-virtual {v1}, Lcom/android/js/api/Hotspot;->disableHotspot()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_0
    return-void

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public disableWifi()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->disableWifi()V

    .line 126
    return-void
.end method

.method public disconnectWifi()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->disconnectWifi()V

    .line 131
    return-void
.end method

.method public enableHotspot(Ljava/lang/String;)V
    .locals 2
    .param p1, "ssid"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/android/js/JavaIPC;->hotspot:Lcom/android/js/api/Hotspot;

    invoke-virtual {v1, p1}, Lcom/android/js/api/Hotspot;->enableHotspot(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_0
    return-void

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public enableWifi()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->enableWifi()V

    .line 121
    return-void
.end method

.method public getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 47
=======
    .line 58
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const-string v0, "root"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

<<<<<<< HEAD
    .line 48
=======
    .line 59
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

<<<<<<< HEAD
    .line 78
    :goto_0
    return-object v0

    .line 49
=======
    .line 89
    :goto_0
    return-object v0

    .line 60
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

<<<<<<< HEAD
    .line 50
=======
    .line 61
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 51
=======
    .line 62
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_1
    const-string v0, "cache"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

<<<<<<< HEAD
    .line 52
=======
    .line 63
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    invoke-static {}, Landroid/os/Environment;->getDownloadCacheDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 53
=======
    .line 64
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_2
    const-string v0, "storage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

<<<<<<< HEAD
    .line 54
=======
    .line 65
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 55
=======
    .line 66
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_3
    const-string v0, "alarms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

<<<<<<< HEAD
    .line 56
=======
    .line 67
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_ALARMS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 57
=======
    .line 68
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_4
    const-string v0, "dcim"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

<<<<<<< HEAD
    .line 58
=======
    .line 69
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 59
=======
    .line 70
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_5
    const-string v0, "downloads"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

<<<<<<< HEAD
    .line 60
=======
    .line 71
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 61
=======
    .line 72
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_6
    const-string v0, "movies"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

<<<<<<< HEAD
    .line 62
=======
    .line 73
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

<<<<<<< HEAD
    .line 63
=======
    .line 74
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_7
    const-string v0, "music"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

<<<<<<< HEAD
    .line 64
=======
    .line 75
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 65
=======
    .line 76
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_8
    const-string v0, "notifications"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

<<<<<<< HEAD
    .line 66
=======
    .line 77
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_NOTIFICATIONS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 67
=======
    .line 78
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_9
    const-string v0, "pictures"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

<<<<<<< HEAD
    .line 68
=======
    .line 79
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 69
=======
    .line 80
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_a
    const-string v0, "podcasts"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

<<<<<<< HEAD
    .line 70
=======
    .line 81
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PODCASTS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 71
=======
    .line 82
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_b
    const-string v0, "ringtones"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

<<<<<<< HEAD
    .line 72
=======
    .line 83
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Landroid/os/Environment;->DIRECTORY_RINGTONES:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 73
=======
    .line 84
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_c
    const-string v0, "appData"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

<<<<<<< HEAD
    .line 74
=======
    .line 85
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->activity:Lcom/android/js/MainActivity;

    invoke-virtual {v0}, Lcom/android/js/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 75
=======
    .line 86
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_d
    const-string v0, "userData"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

<<<<<<< HEAD
    .line 76
=======
    .line 87
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->activity:Lcom/android/js/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/js/MainActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

<<<<<<< HEAD
    .line 78
=======
    .line 89
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    :cond_e
    const-string v0, "-1"

    goto/16 :goto_0
.end method

.method public getWifiScanResults()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->getWifiScanResults()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWifiState()I
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->getWifiState()I

    move-result v0

    return v0
.end method

.method public helloWorld()Ljava/lang/String;
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 42
=======
    .line 53
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Java IPC Works"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

<<<<<<< HEAD
    .line 43
=======
    .line 54
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    const-string v0, "Hello World"

    return-object v0
.end method

.method public initBigNotification(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # [Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 94
=======
    .line 105
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->notification:Lcom/android/js/api/Notification;

    invoke-virtual {v0, p1, p2}, Lcom/android/js/api/Notification;->initBigNotification(Ljava/lang/String;[Ljava/lang/String;)V

<<<<<<< HEAD
    .line 95
=======
    .line 106
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method

.method public initNotification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 84
=======
    .line 95
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->notification:Lcom/android/js/api/Notification;

    invoke-virtual {v0, p1, p2}, Lcom/android/js/api/Notification;->initNotification(Ljava/lang/String;Ljava/lang/String;)V

<<<<<<< HEAD
    .line 85
    return-void
.end method

=======
    .line 96
    return-void
.end method

.method public isHotspotEnabled()Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lcom/android/js/JavaIPC;->hotspot:Lcom/android/js/api/Hotspot;

    invoke-virtual {v0}, Lcom/android/js/api/Hotspot;->isHotspotEnabled()Z

    move-result v0

    return v0
.end method

.method public isWifiEnabled()Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lcom/android/js/JavaIPC;->wifi:Lcom/android/js/api/Wifi;

    invoke-virtual {v0}, Lcom/android/js/api/Wifi;->isWifiEnabled()Z

    move-result v0

    return v0
.end method

>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
.method public makeCall(Ljava/lang/String;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 104
=======
    .line 115
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->call:Lcom/android/js/api/Call;

    invoke-virtual {v0, p1}, Lcom/android/js/api/Call;->makeCall(Ljava/lang/String;)V

<<<<<<< HEAD
    .line 105
=======
    .line 116
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method

.method public showNotification(I)V
    .locals 1
    .param p1, "id"    # I
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 89
=======
    .line 100
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->notification:Lcom/android/js/api/Notification;

    invoke-virtual {v0, p1}, Lcom/android/js/api/Notification;->showNotification(I)V

<<<<<<< HEAD
    .line 90
=======
    .line 101
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method

.method public showToast(Ljava/lang/String;I)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "duration"    # I
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
<<<<<<< HEAD
    .line 99
=======
    .line 110
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    iget-object v0, p0, Lcom/android/js/JavaIPC;->activity:Lcom/android/js/MainActivity;

    invoke-static {v0, p1, p2}, Lcom/android/js/api/Toast;->showToast(Landroid/app/Activity;Ljava/lang/String;I)V

<<<<<<< HEAD
    .line 100
=======
    .line 111
>>>>>>> 9619e4f6942dae718794165ec91e7d30c84c8c8b
    return-void
.end method
