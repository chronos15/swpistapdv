# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.bouncycastle.jce.provider.BouncyCastleProvider
-dontwarn org.bouncycastle.pqc.jcajce.provider.BouncyCastlePQCProvider
-keep class org.xmlpull.v1.** { *; }

# Preserve classes do GetnetPayments
-keep class com.getnet.** { *; }
-keep class com.getnet_payments.** { *; }

# Preserve UUID
-keep class java.util.UUID { *; }

# Preserve serialização JSON
-keepnames class * {
    toJson();
    fromJson();
    toMap();
    fromMap();
}

# Preserva todas as classes e métodos do pacote getnet_payments
-keep class br.com.joelabs.getnet_payments.** { *; }

# Preserva as subclasses de AutomationSlip
-keep class br.com.joelabs.getnet_payments.models.AutomationSlip {
    *;
}

# Se AutomationSlip é uma interface, use esta regra
-keep interface br.com.joelabs.getnet_payments.models.AutomationSlip {
    *;
}

# Mantém as informações de tipo necessárias para reflexão
-keepattributes Signature
-keepattributes *Annotation*


# Preserve APIs internas do Flutter
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.common.MethodChannel$Result { *; }
-keep class io.flutter.plugins.urllauncher.** { *; }

# Suprime avisos de reflexão
-dontwarn com.getnet.**
-dontwarn com.getnet_payments.**
-dontwarn java.util.UUID
-dontwarn io.flutter.embedding.**
-dontwarn io.flutter.plugins.**