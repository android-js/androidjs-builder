.class public Lcom/android/tools/fd/runtime/AndroidInstantRuntime;
.super Ljava/lang/Object;
.source "AndroidInstantRuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/fd/runtime/AndroidInstantRuntime$Logging;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 3
    .param p0, "target"    # Ljava/lang/Class;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-static {p0, p1}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getFieldByName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 122
    .local v0, "declareField":Ljava/lang/reflect/Field;
    if-nez v0, :cond_0

    .line 123
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 125
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 126
    return-object v0
.end method

.method private static getFieldByName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 206
    .local p0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v1, v2}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    sget-object v1, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v3, "getFieldByName:%s in %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 210
    :cond_0
    move-object v0, p0

    .line 211
    .local v0, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 213
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 219
    :goto_1
    return-object v1

    .line 214
    :catch_0
    move-exception v1

    .line 217
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 219
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "paramTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 224
    if-nez p0, :cond_1

    .line 242
    :cond_0
    :goto_0
    return-object v1

    .line 228
    :cond_1
    move-object v0, p0

    .line 229
    .local v0, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_1
    if-eqz v0, :cond_0

    .line 231
    :try_start_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 232
    :catch_0
    move-exception v2

    .line 235
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 236
    if-eqz v0, :cond_2

    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v2, :cond_2

    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v2, v3}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 237
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v4, "getMethodByName:Looking in %s now"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 238
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 237
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static getPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p0, "targetObject"    # Ljava/lang/Object;
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 105
    :try_start_0
    invoke-static {p1, p2}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 106
    .local v0, "declaredField":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 107
    .end local v0    # "declaredField":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 108
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v2, :cond_0

    .line 109
    sget-object v3, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v5, "Exception during%1$s getField %2$s"

    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/Object;

    const/4 v7, 0x0

    if-nez p0, :cond_1

    const-string/jumbo v2, " static"

    :goto_0
    aput-object v2, v6, v7

    const/4 v2, 0x1

    aput-object p2, v6, v2

    .line 110
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 109
    invoke-interface {v3, v4, v2, v1}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 109
    :cond_1
    const-string/jumbo v2, ""

    goto :goto_0
.end method

.method public static getStaticPrivateField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "targetClass"    # Ljava/lang/Class;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static invokeProtectedMethod(Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p0, "receiver"    # Ljava/lang/Object;
    .param p1, "params"    # [Ljava/lang/Object;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .param p3, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 134
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v2, v3}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v4, "protectedMethod:%s on %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p3, v5, v7

    aput-object p0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 138
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2, p3, p2}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 139
    .local v1, "toDispatchTo":Ljava/lang/reflect/Method;
    if-nez v1, :cond_1

    .line 140
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/NoSuchMethodException;

    invoke-direct {v3, p3}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 144
    .end local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 142
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :cond_1
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 143
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    return-object v2

    .line 147
    .end local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception while invoking %s"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object p3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 149
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static invokeProtectedStaticMethod([Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 9
    .param p0, "params"    # [Ljava/lang/Object;
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "receiverClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 159
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v2, v3}, Lcom/android/tools/fd/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 160
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v4, "protectedStaticMethod:%s on %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v8

    .line 161
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 160
    invoke-interface {v2, v3, v4}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 164
    :cond_0
    :try_start_0
    invoke-static {p3, p2, p1}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 165
    .local v1, "toDispatchTo":Ljava/lang/reflect/Method;
    if-nez v1, :cond_1

    .line 166
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " in class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 167
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 171
    .end local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 169
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :cond_1
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 170
    const/4 v2, 0x0

    invoke-virtual {v1, v2, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    return-object v2

    .line 174
    .end local v1    # "toDispatchTo":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception while invoking %s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p2, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static newForClass([Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p0, "params"    # [Ljava/lang/Object;
    .param p1, "paramTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .local p2, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 184
    :try_start_0
    invoke-virtual {p2, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 189
    .local v0, "declaredConstructor":Ljava/lang/reflect/Constructor;
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 191
    :try_start_1
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v2

    return-object v2

    .line 185
    .end local v0    # "declaredConstructor":Ljava/lang/reflect/Constructor;
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception while resolving constructor"

    invoke-interface {v2, v3, v4, v1}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 187
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 192
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v0    # "declaredConstructor":Ljava/lang/reflect/Constructor;
    :catch_1
    move-exception v1

    .line 194
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 195
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v1

    .line 196
    .local v1, "e":Ljava/lang/InstantiationException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception while instantiating %s"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v1}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 198
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_3
    move-exception v1

    .line 199
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception while instantiating %s"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v1}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 200
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static setLogger(Ljava/util/logging/Logger;)V
    .locals 1
    .param p0, "logger"    # Ljava/util/logging/Logger;

    .prologue
    .line 51
    new-instance v0, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;

    invoke-direct {v0, p0}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime$1;-><init>(Ljava/util/logging/Logger;)V

    sput-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    .line 68
    return-void
.end method

.method public static setPrivateField(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 7
    .param p0, "targetObject"    # Ljava/lang/Object;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "targetClass"    # Ljava/lang/Class;
    .param p3, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 87
    :try_start_0
    invoke-static {p2, p3}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 88
    .local v0, "declaredField":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    return-void

    .line 89
    .end local v0    # "declaredField":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v2, :cond_0

    .line 91
    sget-object v2, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string/jumbo v4, "Exception during setPrivateField %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    .line 92
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 91
    invoke-interface {v2, v3, v4, v1}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static setStaticPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lcom/android/tools/fd/runtime/AndroidInstantRuntime;->setPrivateField(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public static trace(Ljava/lang/String;)V
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 246
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 247
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v0, v1, p0}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 249
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;

    .prologue
    .line 252
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 253
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v2, "%s %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 255
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;
    .param p2, "s3"    # Ljava/lang/String;

    .prologue
    .line 258
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 259
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v2, "%s %s %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 261
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;
    .param p2, "s3"    # Ljava/lang/String;
    .param p3, "s4"    # Ljava/lang/String;

    .prologue
    .line 264
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 265
    sget-object v0, Lcom/android/tools/fd/common/Log;->logging:Lcom/android/tools/fd/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string/jumbo v2, "%s %s %s %s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    const/4 v4, 0x3

    aput-object p3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/fd/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 267
    :cond_0
    return-void
.end method
