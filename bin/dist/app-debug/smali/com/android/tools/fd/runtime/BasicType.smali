.class public final enum Lcom/android/tools/fd/runtime/BasicType;
.super Ljava/lang/Enum;
.source "BasicType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/tools/fd/runtime/BasicType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum C:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum D:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum F:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum I:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum J:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum V:Lcom/android/tools/fd/runtime/BasicType;

.field public static final enum Z:Lcom/android/tools/fd/runtime/BasicType;


# instance fields
.field private final primitiveJavaType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 27
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "I"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v4, v2}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->I:Lcom/android/tools/fd/runtime/BasicType;

    .line 28
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "J"

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v5, v2}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->J:Lcom/android/tools/fd/runtime/BasicType;

    .line 29
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "C"

    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v6, v2}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->C:Lcom/android/tools/fd/runtime/BasicType;

    .line 30
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "Z"

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v7, v2}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->Z:Lcom/android/tools/fd/runtime/BasicType;

    .line 31
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "F"

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v8, v2}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->F:Lcom/android/tools/fd/runtime/BasicType;

    .line 32
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "D"

    const/4 v2, 0x5

    sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->D:Lcom/android/tools/fd/runtime/BasicType;

    .line 33
    new-instance v0, Lcom/android/tools/fd/runtime/BasicType;

    const-string/jumbo v1, "V"

    const/4 v2, 0x6

    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/tools/fd/runtime/BasicType;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->V:Lcom/android/tools/fd/runtime/BasicType;

    .line 25
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/android/tools/fd/runtime/BasicType;

    sget-object v1, Lcom/android/tools/fd/runtime/BasicType;->I:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/tools/fd/runtime/BasicType;->J:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/tools/fd/runtime/BasicType;->C:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/tools/fd/runtime/BasicType;->Z:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/android/tools/fd/runtime/BasicType;->F:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/android/tools/fd/runtime/BasicType;->D:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/android/tools/fd/runtime/BasicType;->V:Lcom/android/tools/fd/runtime/BasicType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/tools/fd/runtime/BasicType;->$VALUES:[Lcom/android/tools/fd/runtime/BasicType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "primitiveType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput-object p3, p0, Lcom/android/tools/fd/runtime/BasicType;->primitiveJavaType:Ljava/lang/Class;

    .line 40
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/android/tools/fd/runtime/BasicType;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-static {}, Lcom/android/tools/fd/runtime/BasicType;->values()[Lcom/android/tools/fd/runtime/BasicType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 50
    .local v0, "basicType":Lcom/android/tools/fd/runtime/BasicType;
    invoke-virtual {v0}, Lcom/android/tools/fd/runtime/BasicType;->getJavaType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 54
    .end local v0    # "basicType":Lcom/android/tools/fd/runtime/BasicType;
    :goto_1
    return-object v0

    .line 49
    .restart local v0    # "basicType":Lcom/android/tools/fd/runtime/BasicType;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 54
    .end local v0    # "basicType":Lcom/android/tools/fd/runtime/BasicType;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/tools/fd/runtime/BasicType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/android/tools/fd/runtime/BasicType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/tools/fd/runtime/BasicType;

    return-object v0
.end method

.method public static values()[Lcom/android/tools/fd/runtime/BasicType;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/android/tools/fd/runtime/BasicType;->$VALUES:[Lcom/android/tools/fd/runtime/BasicType;

    invoke-virtual {v0}, [Lcom/android/tools/fd/runtime/BasicType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/tools/fd/runtime/BasicType;

    return-object v0
.end method


# virtual methods
.method public getJavaType()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/tools/fd/runtime/BasicType;->primitiveJavaType:Ljava/lang/Class;

    return-object v0
.end method
