.class Lcom/android/js/api/Hotspot$1;
.super Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;
.source "Hotspot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/js/api/Hotspot;->enableHotspot(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/js/api/Hotspot;


# direct methods
.method constructor <init>(Lcom/android/js/api/Hotspot;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/js/api/Hotspot;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/android/js/api/Hotspot$1;->this$0:Lcom/android/js/api/Hotspot;

    invoke-direct {p0}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed(I)V
    .locals 0
    .param p1, "reason"    # I

    .prologue
    .line 46
    invoke-super {p0, p1}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;->onFailed(I)V

    .line 48
    return-void
.end method

.method public onStarted(Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;)V
    .locals 3
    .param p1, "reservation"    # Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .prologue
    .line 30
    invoke-super {p0, p1}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;->onStarted(Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;)V

    .line 32
    iget-object v2, p0, Lcom/android/js/api/Hotspot$1;->this$0:Lcom/android/js/api/Hotspot;

    invoke-static {v2, p1}, Lcom/android/js/api/Hotspot;->access$002(Lcom/android/js/api/Hotspot;Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;)Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    .line 33
    iget-object v2, p0, Lcom/android/js/api/Hotspot$1;->this$0:Lcom/android/js/api/Hotspot;

    invoke-static {v2}, Lcom/android/js/api/Hotspot;->access$000(Lcom/android/js/api/Hotspot;)Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;->getWifiConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    iget-object v0, v2, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    .line 34
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/js/api/Hotspot$1;->this$0:Lcom/android/js/api/Hotspot;

    invoke-static {v2}, Lcom/android/js/api/Hotspot;->access$000(Lcom/android/js/api/Hotspot;)Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotReservation;->getWifiConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    iget-object v1, v2, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 36
    .local v1, "ussid":Ljava/lang/String;
    return-void
.end method

.method public onStopped()V
    .locals 0

    .prologue
    .line 40
    invoke-super {p0}, Landroid/net/wifi/WifiManager$LocalOnlyHotspotCallback;->onStopped()V

    .line 42
    return-void
.end method
