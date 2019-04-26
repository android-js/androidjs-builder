.class public Lcom/android/js/api/Hotspot;
.super Ljava/lang/Object;
.source "Hotspot.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private local_reservation:Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

.field private wifi_manager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    .line 22
    iput-object p1, p0, Lcom/android/js/api/Hotspot;->activity:Landroid/app/Activity;

    .line 23
    return-void
.end method

.method static synthetic access$000(Lcom/android/js/api/Hotspot;)Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;
    .locals 1
    .param p0, "x0"    # Lcom/android/js/api/Hotspot;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/android/js/api/Hotspot;->local_reservation:Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/js/api/Hotspot;Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;)Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;
    .locals 0
    .param p0, "x0"    # Lcom/android/js/api/Hotspot;
    .param p1, "x1"    # Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/android/js/api/Hotspot;->local_reservation:Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    return-object p1
.end method


# virtual methods
.method public disableHotspot()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x1a

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 60
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_1

    .line 61
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->local_reservation:Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    if-eqz v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->local_reservation:Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;->close()V

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v2, :cond_0

    .line 67
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "setWifiApEnabled"

    new-array v3, v7, [Ljava/lang/Class;

    const-class v4, Landroid/net/wifi/WifiConfiguration;

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 68
    .local v0, "method":Ljava/lang/reflect/Method;
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    new-array v2, v7, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v3, v2, v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public enableHotspot(Ljava/lang/String;)V
    .locals 9
    .param p1, "ssid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x1a

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 25
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v3, :cond_1

    .line 26
    iget-object v2, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    new-instance v3, Lcom/android/js/api/Hotspot$1;

    invoke-direct {v3, p0}, Lcom/android/js/api/Hotspot$1;-><init>(Lcom/android/js/api/Hotspot;)V

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    invoke-virtual {v2, v3, v4}, Landroid/net/wifi/WifiManager;->startLocalOnlyHotspot(Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;Landroid/os/Handler;)V

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v2, v3, :cond_0

    .line 51
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "trying to start hotspot"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 52
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 53
    .local v0, "conf":Landroid/net/wifi/WifiConfiguration;
    iput-object p1, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 54
    iget-object v2, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setWifiApEnabled"

    new-array v4, v8, [Ljava/lang/Class;

    const-class v5, Landroid/net/wifi/WifiConfiguration;

    aput-object v5, v4, v7

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 55
    .local v1, "method":Ljava/lang/reflect/Method;
    iget-object v2, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v7

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public isHotspotEnabled()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 74
    :try_start_0
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "isWifiApEnabled"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 75
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 76
    iget-object v1, p0, Lcom/android/js/api/Hotspot;->wifi_manager:Landroid/net/wifi/WifiManager;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 79
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return v1

    .line 78
    :catch_0
    move-exception v1

    move v1, v2

    .line 79
    goto :goto_0
.end method
